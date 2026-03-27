/*
 * Copyright 2024 Mesa Contributors
 * SPDX-License-Identifier: MIT
 *
 * VK_NV_low_latency2 (NVIDIA Reflex) implementation for NVK.
 *
 * CPU-side only; no special kernel uAPI required.  Swapchain pacing state is
 * kept in a fixed-size open-addressed hash table protected by a single
 * rwlock.  Slots left behind by destroyed swapchains are marked with a
 * tombstone so that probe chains for colliding handles stay intact across
 * create/destroy cycles.
 *
 * vkLatencySleepNV must return immediately (spec §46.3).  A single persistent
 * daemon thread performs the actual pacing sleep via pthread_cond_timedwait,
 * then signals the app's timeline semaphore.
 *
 * This file is self-contained: nvk_DestroySwapchainKHR is defined here so
 * that ll2 state is drained before WSI tears down the swapchain's Vulkan
 * resources.  Only two other source locations need touching:
 *
 *   nvk_meson_ll2.patch          — adds this file to the NVK source list
 *   nvk_physical_device_ll2.patch — advertises NV_low_latency2
 */

#include "nvk_entrypoints.h"
#include "nvk_device.h"

#include "util/macros.h"
#include "vk_log.h"
#include "vk_util.h"

#include <errno.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define NVK_LL2_HIST   64u   /* per-swapchain frame-timing ring depth, must be pow2 */
#define NVK_LL2_TABLE  128u  /* global hash table slots, must be pow2 */

static_assert((NVK_LL2_HIST  & (NVK_LL2_HIST  - 1)) == 0, "NVK_LL2_HIST must be power-of-two");
static_assert((NVK_LL2_TABLE & (NVK_LL2_TABLE - 1)) == 0, "NVK_LL2_TABLE must be power-of-two");

/* (uintptr_t)1 is never a valid dispatchable Vulkan handle. */
#define NVK_LL2_TOMBSTONE ((VkSwapchainKHR)(uintptr_t)1)

/* -------------------------------------------------------------------------
 * Per-swapchain state
 * -------------------------------------------------------------------------
 *
 * last_sleep_ns is _Atomic so record_wake() (daemon) can store into it under
 * a read-lock without upgrading to a write-lock.  All other fields are only
 * touched by API threads under a write-lock, so plain types suffice.
 *
 * Placed at the start of the struct so it sits on its own cache line when
 * the struct is naturally aligned, avoiding false-sharing with the bulk of
 * the fields that are written at marker time (~7 writes per frame).
 */
struct nvk_ll2_state {
   _Atomic uint64_t last_sleep_ns;   /* CLOCK_MONOTONIC ns, written by daemon */

   bool     enabled;
   bool     boost;
   uint32_t min_interval_us;

   VkLatencyTimingsFrameReportNV hist[NVK_LL2_HIST];
   uint32_t hist_head;
   uint32_t hist_count;
};

struct nvk_ll2_entry {
   VkSwapchainKHR       key;  /* VK_NULL_HANDLE = empty, TOMBSTONE = dead */
   struct nvk_ll2_state val;
};

static pthread_rwlock_t     g_ll2_lock = PTHREAD_RWLOCK_INITIALIZER;
static struct nvk_ll2_entry g_ll2_tbl[NVK_LL2_TABLE];

/* -------------------------------------------------------------------------
 * Hash table helpers (caller holds g_ll2_lock)
 * -------------------------------------------------------------------------
 *
 * Open addressing with linear probing and tombstone markers.  A null slot
 * terminates any probe chain because we only advance past tombstones, not
 * nulls — once a slot has never been written it cannot be part of a chain.
 */

static uint32_t
ll2_hash(VkSwapchainKHR sc)
{
   /* Finalisation mix from MurmurHash3. */
   uint64_t v = (uint64_t)(uintptr_t)sc;
   v ^= v >> 33;
   v *= UINT64_C(0xff51afd7ed558ccd);
   v ^= v >> 33;
   return (uint32_t)(v & (NVK_LL2_TABLE - 1));
}

/*
 * Returns the existing entry for sc, or allocates a new slot (preferring
 * tombstone slots over fresh nulls).  Returns NULL only when every slot in
 * the table holds a live entry.
 */
static struct nvk_ll2_state *
ll2_get_or_create(VkSwapchainKHR sc)
{
   const uint32_t h = ll2_hash(sc);
   struct nvk_ll2_entry *tomb = NULL;

   for (uint32_t i = 0; i < NVK_LL2_TABLE; i++) {
      struct nvk_ll2_entry *e = &g_ll2_tbl[(h + i) & (NVK_LL2_TABLE - 1)];

      if (e->key == sc)
         return &e->val;

      if (e->key == NVK_LL2_TOMBSTONE) {
         if (!tomb)
            tomb = e;
         continue;
      }

      if (e->key == VK_NULL_HANDLE) {
         struct nvk_ll2_entry *slot = tomb ? tomb : e;
         slot->key = sc;
         memset(&slot->val, 0, sizeof(slot->val));
         return &slot->val;
      }
   }

   /* Table full of live entries; try the tombstone we passed, if any. */
   if (unlikely(tomb)) {
      tomb->key = sc;
      memset(&tomb->val, 0, sizeof(tomb->val));
      return &tomb->val;
   }
   return NULL;
}

/*
 * Like ll2_get_or_create but always resets the entry to a clean state.
 * Use this in SetLatencySleepModeNV so that a reused handle (same pointer
 * value after destroy+create) starts fresh rather than inheriting old timing
 * state from a previous swapchain.
 */
static struct nvk_ll2_state *
ll2_reset_or_create(VkSwapchainKHR sc)
{
   struct nvk_ll2_state *s = ll2_get_or_create(sc);
   if (s) {
      /* Reset pacing and history; hist[] slots are overwritten as frames
       * arrive so only the bookkeeping fields need clearing. */
      atomic_store_explicit(&s->last_sleep_ns, 0, memory_order_relaxed);
      s->enabled         = false;
      s->boost           = false;
      s->min_interval_us = 0;
      s->hist_head       = 0;
      s->hist_count      = 0;
   }
   return s;
}

/* Returns the entry for sc, or NULL.  Skips tombstones; stops at nulls. */
static struct nvk_ll2_state *
ll2_find(VkSwapchainKHR sc)
{
   const uint32_t h = ll2_hash(sc);
   for (uint32_t i = 0; i < NVK_LL2_TABLE; i++) {
      struct nvk_ll2_entry *e = &g_ll2_tbl[(h + i) & (NVK_LL2_TABLE - 1)];
      if (e->key == sc)
         return &e->val;
      if (e->key == VK_NULL_HANDLE)
         return NULL;
   }
   return NULL;
}

/*
 * Tombstones the entry for sc so its slot can be reused.  We do not zero the
 * value; ll2_get_or_create always memsets on slot allocation.
 */
static void
ll2_erase(VkSwapchainKHR sc)
{
   const uint32_t h = ll2_hash(sc);
   for (uint32_t i = 0; i < NVK_LL2_TABLE; i++) {
      struct nvk_ll2_entry *e = &g_ll2_tbl[(h + i) & (NVK_LL2_TABLE - 1)];
      if (e->key == sc) {
         e->key = NVK_LL2_TOMBSTONE;
         return;
      }
      if (e->key == VK_NULL_HANDLE)
         return;
   }
}

/* -------------------------------------------------------------------------
 * Frame-timing ring buffer (caller holds g_ll2_lock for writing)
 * -------------------------------------------------------------------------
 *
 * Frames arrive roughly in-order; we search backwards from the newest entry
 * so hits for the current frame are O(1) in the common case.
 */
static VkLatencyTimingsFrameReportNV *
ll2_frame_get_or_create(struct nvk_ll2_state *s, uint64_t present_id)
{
   /* Search newest-first — common case is the current frame. */
   for (uint32_t i = 0; i < s->hist_count; i++) {
      uint32_t idx = (s->hist_head - 1u - i + NVK_LL2_HIST) & (NVK_LL2_HIST - 1u);
      if (s->hist[idx].presentID == present_id)
         return &s->hist[idx];
   }

   /* Allocate a new slot, evicting the oldest if the ring is full. */
   uint32_t slot    = s->hist_head;
   s->hist_head     = (slot + 1u) & (NVK_LL2_HIST - 1u);
   if (s->hist_count < NVK_LL2_HIST)
      s->hist_count++;

   VkLatencyTimingsFrameReportNV *fr = &s->hist[slot];
   *fr = (VkLatencyTimingsFrameReportNV){
      .sType     = VK_STRUCTURE_TYPE_LATENCY_TIMINGS_FRAME_REPORT_NV,
      .presentID = present_id,
   };
   return fr;
}

/* -------------------------------------------------------------------------
 * Clock helpers
 *
 * Each helper issues exactly one clock_gettime() syscall.
 * -------------------------------------------------------------------------
 */

static inline uint64_t
monotonic_ns(void)
{
   struct timespec ts;
   clock_gettime(CLOCK_MONOTONIC, &ts);
   return (uint64_t)ts.tv_sec * UINT64_C(1000000000) + (uint64_t)ts.tv_nsec;
}

static inline uint64_t
monotonic_us(void)
{
   struct timespec ts;
   clock_gettime(CLOCK_MONOTONIC, &ts);
   return (uint64_t)ts.tv_sec * UINT64_C(1000000) +
          (uint64_t)ts.tv_nsec / UINT64_C(1000);
}

/* -------------------------------------------------------------------------
 * Timeline-semaphore signal helper
 *
 * Consolidated from the former ll2_do_signal / ll2_signal_sync pair.
 * May be called with or without any lock held; SignalSemaphore is
 * re-entrant.  Returns the Vulkan result so callers can propagate errors.
 * -------------------------------------------------------------------------
 */
static VkResult
ll2_signal_sem(VkDevice device, VkSemaphore semaphore, uint64_t value)
{
   const VkSemaphoreSignalInfo si = {
      .sType     = VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO,
      .semaphore = semaphore,
      .value     = value,
   };
   struct nvk_device *dev = nvk_device_from_handle(device);
   return dev->vk.dispatch_table.SignalSemaphore(device, &si);
}

/* -------------------------------------------------------------------------
 * Persistent sleep daemon
 * -------------------------------------------------------------------------
 *
 * A single long-lived thread serialises all latency-sleep requests.  The
 * application submits a request under g_daemon.mutex and wakes the thread
 * via g_daemon.cond, which is initialised with CLOCK_MONOTONIC (constructor
 * below) so that monotonic deadlines can be passed directly without any
 * CLOCK_REALTIME conversion.
 *
 * Swapchain-destroy safety
 * ~~~~~~~~~~~~~~~~~~~~~~~~
 * g_daemon.current_sc tracks which swapchain the daemon is currently
 * executing.  ll2_do_swapchain_cleanup() waits on g_daemon.done_cond
 * until current_sc is cleared, guaranteeing the daemon has finished using
 * the VkDevice / VkSemaphore handles before WSI tears them down.
 *
 * Thread lifetime
 * ~~~~~~~~~~~~~~~
 * The library destructor sets g_daemon.shutdown, signals the condvar, and
 * joins the thread so it cannot outlive the .so mapping.  If the thread
 * exits unexpectedly, g_daemon.running is cleared inside the thread so that
 * a future call to ll2_daemon_ensure_running() can re-spawn it.
 */

struct ll2_daemon_req {
   bool           has_req;       /* a request is pending                        */
   bool           cancelled;     /* set while req is queued, before consume      */
   VkDevice       device;
   VkSwapchainKHR swapchain;
   VkSemaphore    semaphore;
   uint64_t       value;
   uint64_t       wake_ns;       /* abs CLOCK_MONOTONIC target; 0 = signal now  */
};

static struct {
   pthread_mutex_t    mutex;

   /* Initialised with CLOCK_MONOTONIC in ll2_global_init(); NOT PTHREAD_COND_INITIALIZER. */
   pthread_cond_t     cond;

   /* Plain REALTIME is fine here — no pthread_cond_timedwait on done_cond. */
   pthread_cond_t     done_cond;

   pthread_t          tid;
   bool               running;
   bool               shutdown;

   struct ll2_daemon_req req;

   /* Swapchain currently executing (consumed from .req, not yet signalled).
    * VK_NULL_HANDLE when the daemon is idle.                                */
   VkSwapchainKHR     current_sc;

   /* Set under .mutex when current_sc is being destroyed; causes the daemon
    * to skip the signal for this request.                                   */
   bool               current_cancelled;
} g_daemon = {
   .mutex     = PTHREAD_MUTEX_INITIALIZER,
   .done_cond = PTHREAD_COND_INITIALIZER,
   /* .cond: set up by ll2_global_init() */
};

__attribute__((constructor)) static void
ll2_global_init(void)
{
   pthread_condattr_t ca;
   pthread_condattr_init(&ca);
   pthread_condattr_setclock(&ca, CLOCK_MONOTONIC);
   pthread_cond_init(&g_daemon.cond, &ca);
   pthread_condattr_destroy(&ca);
}

__attribute__((destructor)) static void
ll2_global_fini(void)
{
   pthread_mutex_lock(&g_daemon.mutex);
   g_daemon.shutdown = true;
   pthread_cond_signal(&g_daemon.cond);
   bool     was_running = g_daemon.running;
   pthread_t       tid  = g_daemon.tid;
   pthread_mutex_unlock(&g_daemon.mutex);

   if (was_running)
      pthread_join(tid, NULL);

   pthread_cond_destroy(&g_daemon.cond);
}

/*
 * ll2_record_wake — update last_sleep_ns after the daemon wakes.
 *
 * Takes a read-lock (not a write-lock) and stores with relaxed ordering.
 * The rdlock is still required to prevent ll2_erase() from running
 * concurrently.  Only one daemon thread ever writes last_sleep_ns, and the
 * rwlock prevents the entry from being erased mid-store, so relaxed ordering
 * is sufficient.
 */
static void
ll2_record_wake(VkSwapchainKHR swapchain, uint64_t wake_ns)
{
   pthread_rwlock_rdlock(&g_ll2_lock);
   struct nvk_ll2_state *s = ll2_find(swapchain);
   if (s)
      atomic_store_explicit(&s->last_sleep_ns, wake_ns, memory_order_relaxed);
   pthread_rwlock_unlock(&g_ll2_lock);
}

/*
 * ll2_daemon_cancel_swapchain — mark queued or in-flight work as cancelled.
 *
 * Must be called under g_daemon.mutex.
 * - "Queued" (has_req == true): set req.cancelled so the daemon skips it at
 *   consume time.
 * - "In-flight" (current_sc == sc): set current_cancelled and signal the
 *   condvar so a sleeping daemon wakes and checks the flag before signalling.
 */
static void
ll2_daemon_cancel_swapchain(VkSwapchainKHR sc)
{
   if (g_daemon.req.has_req && g_daemon.req.swapchain == sc)
      g_daemon.req.cancelled = true;

   if (g_daemon.current_sc == sc) {
      g_daemon.current_cancelled = true;
      pthread_cond_signal(&g_daemon.cond);
   }
}

static void *
ll2_daemon_thread(void *arg)
{
   (void)arg;

   pthread_mutex_lock(&g_daemon.mutex);

   while (!g_daemon.shutdown) {

      /* Block until a request or shutdown arrives. */
      while (!g_daemon.req.has_req && !g_daemon.shutdown)
         pthread_cond_wait(&g_daemon.cond, &g_daemon.mutex);

      if (g_daemon.shutdown)
         break;

      /* Consume the request while holding the mutex. */
      struct ll2_daemon_req r = g_daemon.req;
      g_daemon.req.has_req    = false;

      /* Register the in-flight swapchain for cancel detection. */
      g_daemon.current_sc        = r.swapchain;
      g_daemon.current_cancelled = false;

      if (r.cancelled)
         goto done;

      if (r.wake_ns == 0) {
         /* No pacing needed — signal immediately. */
         pthread_mutex_unlock(&g_daemon.mutex);
         if (!g_daemon.current_cancelled) {
            ll2_record_wake(r.swapchain, monotonic_ns());
            ll2_signal_sem(r.device, r.semaphore, r.value);
         }
         pthread_mutex_lock(&g_daemon.mutex);
         goto done;
      }

      {
         /* Sleep until the monotonic deadline.  The condvar uses
          * CLOCK_MONOTONIC (set in ll2_global_init), so no conversion. */
         uint64_t now_mono   = monotonic_ns();
         int      wait_result = ETIMEDOUT;

         if (r.wake_ns > now_mono) {
            struct timespec deadline = {
               .tv_sec  = (time_t)(r.wake_ns / UINT64_C(1000000000)),
               .tv_nsec = (long)  (r.wake_ns % UINT64_C(1000000000)),
            };
            wait_result = pthread_cond_timedwait(&g_daemon.cond,
                                                 &g_daemon.mutex, &deadline);
         }

         /* Re-check after sleep — the cancel path woke us early. */
         if (g_daemon.current_cancelled)
            goto done;

         pthread_mutex_unlock(&g_daemon.mutex);

         if (wait_result == ETIMEDOUT) {
            /* Normal path: interval elapsed. */
            ll2_record_wake(r.swapchain, monotonic_ns());
            ll2_signal_sem(r.device, r.semaphore, r.value);
         } else {
            /* Woken early (new request or shutdown).  Signal the old
             * semaphore so the app is never permanently stuck. */
            ll2_signal_sem(r.device, r.semaphore, r.value);
         }

         pthread_mutex_lock(&g_daemon.mutex);
      }

   done:
      /* Clear the in-flight swapchain and wake anyone blocked in
       * ll2_do_swapchain_cleanup(). */
      g_daemon.current_sc = VK_NULL_HANDLE;
      pthread_cond_broadcast(&g_daemon.done_cond);
   }

   /* Clear running so ll2_daemon_ensure_running() can re-spawn if needed. */
   g_daemon.running = false;

   /* Wake any blocked ll2_do_swapchain_cleanup() callers during shutdown. */
   pthread_cond_broadcast(&g_daemon.done_cond);

   pthread_mutex_unlock(&g_daemon.mutex);
   return NULL;
}

/* Ensure the daemon thread is live.  Called under g_daemon.mutex. */
static bool
ll2_daemon_ensure_running(void)
{
   if (g_daemon.running)
      return true;

   pthread_attr_t attr;
   pthread_attr_init(&attr);
   /* 64 KiB stack is ample for this thread and avoids the 8 MiB default. */
   pthread_attr_setstacksize(&attr, 64u * 1024u);
   int rc = pthread_create(&g_daemon.tid, &attr, ll2_daemon_thread, NULL);
   pthread_attr_destroy(&attr);

   if (unlikely(rc != 0))
      return false;

   g_daemon.running = true;
   return true;
}

/*
 * Submit a pacing request to the daemon.  Returns false if the thread
 * could not be started; caller falls back to a synchronous signal.
 */
static bool
ll2_daemon_submit(VkDevice device, VkSwapchainKHR swapchain,
                  VkSemaphore semaphore, uint64_t value, uint64_t wake_ns)
{
   pthread_mutex_lock(&g_daemon.mutex);

   if (unlikely(!ll2_daemon_ensure_running())) {
      pthread_mutex_unlock(&g_daemon.mutex);
      return false;
   }

   g_daemon.req = (struct ll2_daemon_req){
      .has_req   = true,
      .cancelled = false,
      .device    = device,
      .swapchain = swapchain,
      .semaphore = semaphore,
      .value     = value,
      .wake_ns   = wake_ns,
   };
   pthread_cond_signal(&g_daemon.cond);

   pthread_mutex_unlock(&g_daemon.mutex);
   return true;
}

/* -------------------------------------------------------------------------
 * ll2_do_swapchain_cleanup — internal helper, called from two places:
 *   nvk_DestroySwapchainKHR (before WSI teardown)
 *   nvk_SetLatencySleepModeNV(sc, NULL) (explicit application disable)
 *
 * Must be called BEFORE the swapchain's Vulkan resources are freed.
 *
 * 1. Cancels any pending or in-flight daemon request for this swapchain.
 * 2. Waits on done_cond until the daemon has finished, so it is safe for
 *    WSI to free the VkDevice / VkSemaphore handles.
 * 3. Tombstones the hash-table entry so the slot is available for the next
 *    swapchain Proton or DXVK creates.
 * -------------------------------------------------------------------------
 */
static void
ll2_do_swapchain_cleanup(VkSwapchainKHR sc)
{
   if (sc == VK_NULL_HANDLE)
      return;

   /* Step 1+2: cancel daemon work and wait until it finishes.
    *
    * We hold daemon mutex while waiting on done_cond; the daemon re-takes
    * the mutex before clearing current_sc and broadcasting, so the condwait
    * is free of TOCTOU races.
    */
   pthread_mutex_lock(&g_daemon.mutex);
   ll2_daemon_cancel_swapchain(sc);
   while (g_daemon.current_sc == sc)
      pthread_cond_wait(&g_daemon.done_cond, &g_daemon.mutex);
   pthread_mutex_unlock(&g_daemon.mutex);

   /* Step 3: tombstone the hash-table entry.
    *
    * Safe because the daemon holds no reference to this entry and the
    * wrlock blocks concurrent readers until the tombstone is in place.
    */
   pthread_rwlock_wrlock(&g_ll2_lock);
   ll2_erase(sc);
   pthread_rwlock_unlock(&g_ll2_lock);
}

/* -------------------------------------------------------------------------
 * VK_NV_low_latency2 entry points
 * -------------------------------------------------------------------------
 */

VKAPI_ATTR VkResult VKAPI_CALL
nvk_SetLatencySleepModeNV(VkDevice device,
                          VkSwapchainKHR swapchain,
                          const VkLatencySleepModeInfoNV *pSleepModeInfo)
{
   if (!pSleepModeInfo) {
      /* NULL disables low-latency mode — treat like a swapchain destroy. */
      ll2_do_swapchain_cleanup(swapchain);
      return VK_SUCCESS;
   }

   pthread_rwlock_wrlock(&g_ll2_lock);

   /*
    * ll2_reset_or_create handles both first-time setup and the handle-reuse
    * case (a new swapchain that happens to have the same pointer value as a
    * previously-destroyed one).  Resetting here ensures stale pacing state
    * from the old swapchain does not bleed into the new one.
    */
   struct nvk_ll2_state *s = ll2_reset_or_create(swapchain);
   if (unlikely(!s)) {
      pthread_rwlock_unlock(&g_ll2_lock);
      return VK_ERROR_OUT_OF_HOST_MEMORY;
   }

   s->enabled         = pSleepModeInfo->lowLatencyMode  == VK_TRUE;
   s->boost           = pSleepModeInfo->lowLatencyBoost == VK_TRUE;
   s->min_interval_us = pSleepModeInfo->minimumIntervalUs;

   pthread_rwlock_unlock(&g_ll2_lock);
   return VK_SUCCESS;
}

VKAPI_ATTR VkResult VKAPI_CALL
nvk_LatencySleepNV(VkDevice device,
                   VkSwapchainKHR swapchain,
                   const VkLatencySleepInfoNV *pSleepInfo)
{
   /*
    * Spec: "vkLatencySleepNV returns immediately."  We snapshot the pacing
    * parameters under a read-lock and hand the actual sleep off to the
    * daemon thread, which signals the semaphore when done.
    *
    * last_sleep_ns is _Atomic; read with relaxed load while holding rdlock.
    * wake_target is a CLOCK_MONOTONIC absolute nanosecond value; the daemon
    * passes it directly to pthread_cond_timedwait without conversion.
    */
   pthread_rwlock_rdlock(&g_ll2_lock);
   const struct nvk_ll2_state *s     = ll2_find(swapchain);
   const bool                  pace  = s && s->min_interval_us > 0;
   const uint64_t              min_ns = pace ? (uint64_t)s->min_interval_us * 1000u : 0;
   const uint64_t              last_ns = pace
      ? atomic_load_explicit(&s->last_sleep_ns, memory_order_relaxed)
      : 0;
   pthread_rwlock_unlock(&g_ll2_lock);

   uint64_t wake_target = 0;
   if (pace && last_ns) {
      uint64_t candidate = last_ns + min_ns;
      if (candidate > monotonic_ns())
         wake_target = candidate;
   }

   if (!ll2_daemon_submit(device, swapchain,
                          pSleepInfo->signalSemaphore,
                          pSleepInfo->value, wake_target)) {
      /* Daemon could not start — signal synchronously so the app never stalls. */
      return ll2_signal_sem(device, pSleepInfo->signalSemaphore, pSleepInfo->value);
   }

   return VK_SUCCESS;
}

VKAPI_ATTR void VKAPI_CALL
nvk_SetLatencyMarkerNV(VkDevice device,
                       VkSwapchainKHR swapchain,
                       const VkSetLatencyMarkerInfoNV *pLatencyMarkerInfo)
{
   /* Single clock_gettime() for the entire marker record. */
   uint64_t ts_us = monotonic_us();

   pthread_rwlock_wrlock(&g_ll2_lock);

   /*
    * ll2_get_or_create handles both "entry exists" and "first marker before
    * SetLatencySleepModeNV" in one probe, avoiding a redundant find pass.
    */
   struct nvk_ll2_state *s = ll2_get_or_create(swapchain);
   if (unlikely(!s)) {
      pthread_rwlock_unlock(&g_ll2_lock);
      return;
   }

   VkLatencyTimingsFrameReportNV *fr =
      ll2_frame_get_or_create(s, pLatencyMarkerInfo->presentID);

   switch (pLatencyMarkerInfo->marker) {
   case VK_LATENCY_MARKER_SIMULATION_START_NV:
      fr->simStartTimeUs          = ts_us; break;
   case VK_LATENCY_MARKER_SIMULATION_END_NV:
      fr->simEndTimeUs            = ts_us; break;
   case VK_LATENCY_MARKER_RENDERSUBMIT_START_NV:
      fr->renderSubmitStartTimeUs = ts_us; break;
   case VK_LATENCY_MARKER_RENDERSUBMIT_END_NV:
      fr->renderSubmitEndTimeUs   = ts_us; break;
   case VK_LATENCY_MARKER_PRESENT_START_NV:
      fr->presentStartTimeUs      = ts_us; break;
   case VK_LATENCY_MARKER_PRESENT_END_NV:
      fr->presentEndTimeUs        = ts_us; break;
   case VK_LATENCY_MARKER_INPUT_SAMPLE_NV:
      fr->inputSampleTimeUs       = ts_us; break;
   /* Out-of-band markers relate to driver/OS/GPU scheduling that we have no
    * visibility into; drop them rather than corrupt CPU-side fields. */
   case VK_LATENCY_MARKER_OUT_OF_BAND_RENDERSUBMIT_START_NV:
   case VK_LATENCY_MARKER_OUT_OF_BAND_RENDERSUBMIT_END_NV:
   case VK_LATENCY_MARKER_OUT_OF_BAND_PRESENT_START_NV:
   case VK_LATENCY_MARKER_OUT_OF_BAND_PRESENT_END_NV:
   case VK_LATENCY_MARKER_TRIGGER_FLASH_NV:
   default:
      break;
   }

   pthread_rwlock_unlock(&g_ll2_lock);
}

VKAPI_ATTR void VKAPI_CALL
nvk_GetLatencyTimingsNV(VkDevice device,
                        VkSwapchainKHR swapchain,
                        VkGetLatencyMarkerInfoNV *pLatencyMarkerInfo)
{
   pthread_rwlock_rdlock(&g_ll2_lock);

   const struct nvk_ll2_state *s = ll2_find(swapchain);

   if (!s || !s->hist_count) {
      pLatencyMarkerInfo->timingCount = 0;
      pthread_rwlock_unlock(&g_ll2_lock);
      return;
   }

   if (!pLatencyMarkerInfo->pTimings) {
      pLatencyMarkerInfo->timingCount = s->hist_count;
      pthread_rwlock_unlock(&g_ll2_lock);
      return;
   }

   uint32_t out_n = MIN2(pLatencyMarkerInfo->timingCount, s->hist_count);
   pLatencyMarkerInfo->timingCount = out_n;

   for (uint32_t i = 0; i < out_n; i++) {
      uint32_t src =
         (s->hist_head - s->hist_count + i + NVK_LL2_HIST) & (NVK_LL2_HIST - 1u);
      const VkLatencyTimingsFrameReportNV *rec = &s->hist[src];
      VkLatencyTimingsFrameReportNV       *dst = &pLatencyMarkerInfo->pTimings[i];

      /* Preserve the caller's sType/pNext chain; copy the timing payload.
       * Struct copy then restore is future-proof if new fields are added. */
      VkStructureType saved_stype = dst->sType;
      void           *saved_pnext = dst->pNext;
      *dst                        = *rec;
      dst->sType                  = saved_stype;
      dst->pNext                  = saved_pnext;

      /* No GPU/driver/OS timing available in this CPU-side implementation. */
      dst->driverStartTimeUs        = 0;
      dst->driverEndTimeUs          = 0;
      dst->osRenderQueueStartTimeUs = 0;
      dst->osRenderQueueEndTimeUs   = 0;
      dst->gpuRenderStartTimeUs     = 0;
      dst->gpuRenderEndTimeUs       = 0;
   }

   pthread_rwlock_unlock(&g_ll2_lock);
}

VKAPI_ATTR void VKAPI_CALL
nvk_QueueNotifyOutOfBandNV(VkQueue queue,
                           const VkOutOfBandQueueTypeInfoNV *pQueueTypeInfo)
{
   /* NVK has no out-of-band GPU scheduler. */
   (void)queue;
   (void)pQueueTypeInfo;
}

/* -------------------------------------------------------------------------
 * nvk_DestroySwapchainKHR — defined here so the ll2 cleanup is self-contained
 *
 * This overrides the auto-generated stub that would call wsi_DestroySwapchain
 * directly.  By intercepting here we drain Reflex state (cancel the pacing
 * daemon, tombstone the hash table entry) before WSI releases the underlying
 * Vulkan objects.  The intercept is a no-op when ll2 was never used on this
 * swapchain, so there is no overhead on the non-Reflex path.
 *
 * wsi_DestroySwapchainKHR is not declared in wsi_common.h (it is a generated
 * entry point in wsi_common.c); the extern declaration below satisfies
 * -Werror=missing-prototypes without pulling in generated WSI headers.
 * -------------------------------------------------------------------------
 */
extern VKAPI_ATTR void VKAPI_CALL
wsi_DestroySwapchainKHR(VkDevice                      device,
                        VkSwapchainKHR                swapchain,
                        const VkAllocationCallbacks  *pAllocator);

VKAPI_ATTR void VKAPI_CALL
nvk_DestroySwapchainKHR(VkDevice                      device,
                        VkSwapchainKHR                swapchain,
                        const VkAllocationCallbacks  *pAllocator)
{
   ll2_do_swapchain_cleanup(swapchain);
   wsi_DestroySwapchainKHR(device, swapchain, pAllocator);
}
