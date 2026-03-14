/*
 * Copyright 2024 Mesa Contributors
 * SPDX-License-Identifier: MIT
 *
 * VK_NV_low_latency2 (NVIDIA Reflex) stub for NVK.
 *
 * CPU-side only; no special kernel uAPI required.  Swapchain pacing state is
 * kept in a fixed-size open-addressed hash table protected by a single
 * rwlock.  Slots left behind by destroyed swapchains are marked with a
 * tombstone so that probe chains for colliding handles stay intact across
 * create/destroy cycles.
 *
 * vkLatencySleepNV must return immediately (spec §46.3).  A detached thread
 * performs the clock_nanosleep and then signals the app's timeline semaphore.
 * On pthread_create failure we signal synchronously so the game is never
 * permanently stuck.
 *
 * vkQueueNotifyOutOfBandNV is intentionally a no-op; NVK has no out-of-band
 * GPU scheduler.
 */

#include "nvk_entrypoints.h"
#include "nvk_device.h"

#include "util/macros.h"
#include "vk_log.h"
#include "vk_util.h"

#include <errno.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define NVK_LL2_HIST   64u   /* per-swapchain frame-timing ring depth */
#define NVK_LL2_TABLE  128u  /* global hash table slots (must be pow2) */

/* (uintptr_t)1 is never a valid dispatchable Vulkan handle */
#define NVK_LL2_TOMBSTONE ((VkSwapchainKHR)(uintptr_t)1)

struct nvk_ll2_state {
   bool     enabled;
   bool     boost;
   uint32_t min_interval_us;
   uint64_t last_sleep_ns;     /* CLOCK_MONOTONIC ns at end of last sleep */

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

/* --- hash table helpers (caller holds g_ll2_lock) --- */

static uint32_t
ll2_hash(VkSwapchainKHR sc)
{
   uint64_t v = (uint64_t)(uintptr_t)sc;
   v ^= v >> 33;
   v *= UINT64_C(0xff51afd7ed558ccd);
   v ^= v >> 33;
   return (uint32_t)(v & (NVK_LL2_TABLE - 1));
}

/* Returns existing entry or allocates a new slot (reusing tombstones).
 * Returns NULL only if the table is completely full of live entries. */
static struct nvk_ll2_state *
ll2_get_or_create(VkSwapchainKHR sc)
{
   const uint32_t h = ll2_hash(sc);
   struct nvk_ll2_entry *tomb = NULL;

   for (uint32_t i = 0; i < NVK_LL2_TABLE; i++) {
      struct nvk_ll2_entry *e = &g_ll2_tbl[(h + i) & (NVK_LL2_TABLE - 1)];

      if (e->key == sc)
         return &e->val;

      if (e->key == NVK_LL2_TOMBSTONE && !tomb)
         tomb = e;

      if (e->key == VK_NULL_HANDLE) {
         struct nvk_ll2_entry *slot = tomb ? tomb : e;
         slot->key = sc;
         memset(&slot->val, 0, sizeof(slot->val));
         return &slot->val;
      }
   }

   if (tomb) {
      tomb->key = sc;
      memset(&tomb->val, 0, sizeof(tomb->val));
      return &tomb->val;
   }
   return NULL;
}

/* Tombstones are skipped; VK_NULL_HANDLE terminates the search. */
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

static void
ll2_erase(VkSwapchainKHR sc)
{
   const uint32_t h = ll2_hash(sc);
   for (uint32_t i = 0; i < NVK_LL2_TABLE; i++) {
      struct nvk_ll2_entry *e = &g_ll2_tbl[(h + i) & (NVK_LL2_TABLE - 1)];
      if (e->key == sc) {
         memset(&e->val, 0, sizeof(e->val));
         e->key = NVK_LL2_TOMBSTONE;
         return;
      }
      if (e->key == VK_NULL_HANDLE)
         return;
   }
}

/* --- ring buffer --- */

static VkLatencyTimingsFrameReportNV *
ll2_frame_get_or_create(struct nvk_ll2_state *s, uint64_t present_id)
{
   for (uint32_t i = 0; i < s->hist_count; i++) {
      uint32_t idx = (s->hist_head - 1u - i + NVK_LL2_HIST) & (NVK_LL2_HIST - 1u);
      if (s->hist[idx].presentID == present_id)
         return &s->hist[idx];
   }

   uint32_t slot = s->hist_head;
   s->hist_head = (slot + 1u) & (NVK_LL2_HIST - 1u);
   if (s->hist_count < NVK_LL2_HIST)
      s->hist_count++;

   VkLatencyTimingsFrameReportNV *fr = &s->hist[slot];
   memset(fr, 0, sizeof(*fr));
   fr->sType     = VK_STRUCTURE_TYPE_LATENCY_TIMINGS_FRAME_REPORT_NV;
   fr->presentID = present_id;
   return fr;
}

/* --- clock helpers --- */

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
   return monotonic_ns() / UINT64_C(1000);
}

/* --- async sleep thread --- */

struct ll2_sleep_args {
   VkDevice       device;
   VkSwapchainKHR swapchain;
   VkSemaphore    semaphore;
   uint64_t       value;
   uint64_t       wake_target_ns;  /* abs CLOCK_MONOTONIC; 0 = signal now */
};

static void *
ll2_sleep_thread(void *arg)
{
   struct ll2_sleep_args *a = arg;

   if (a->wake_target_ns) {
      struct timespec wts = {
         .tv_sec  = (time_t)(a->wake_target_ns / UINT64_C(1000000000)),
         .tv_nsec = (long)  (a->wake_target_ns % UINT64_C(1000000000)),
      };
      int r;
      do {
         r = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &wts, NULL);
      } while (r == EINTR);
   }

   /* Record wake time for next interval. */
   uint64_t wake_actual = monotonic_ns();
   pthread_rwlock_wrlock(&g_ll2_lock);
   struct nvk_ll2_state *s = ll2_find(a->swapchain);
   if (s)
      s->last_sleep_ns = wake_actual;
   pthread_rwlock_unlock(&g_ll2_lock);

   const VkSemaphoreSignalInfo si = {
      .sType     = VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO,
      .semaphore = a->semaphore,
      .value     = a->value,
   };
   struct nvk_device *dev = nvk_device_from_handle(a->device);
   dev->vk.dispatch_table.SignalSemaphore(a->device, &si);

   free(a);
   return NULL;
}

static VkResult
ll2_signal_sync(VkDevice device, VkSemaphore semaphore, uint64_t value)
{
   const VkSemaphoreSignalInfo si = {
      .sType     = VK_STRUCTURE_TYPE_SEMAPHORE_SIGNAL_INFO,
      .semaphore = semaphore,
      .value     = value,
   };
   struct nvk_device *dev = nvk_device_from_handle(device);
   return dev->vk.dispatch_table.SignalSemaphore(device, &si);
}

/* --- VK_NV_low_latency2 entry points --- */

VKAPI_ATTR VkResult VKAPI_CALL
nvk_SetLatencySleepModeNV(VkDevice device,
                          VkSwapchainKHR swapchain,
                          const VkLatencySleepModeInfoNV *pSleepModeInfo)
{
   pthread_rwlock_wrlock(&g_ll2_lock);

   if (!pSleepModeInfo) {
      ll2_erase(swapchain);
      pthread_rwlock_unlock(&g_ll2_lock);
      return VK_SUCCESS;
   }

   struct nvk_ll2_state *s = ll2_get_or_create(swapchain);
   if (!s) {
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
    * parameters under the read lock and hand the actual sleep off to a
    * detached thread which signals the semaphore when done.
    *
    * minimumIntervalUs is enforced regardless of lowLatencyMode per spec
    * §46.3: "If lowLatencyMode is VK_FALSE, lowLatencyBoost will still hint
    * to the GPU to increase its power state and vkLatencySleepNV will still
    * enforce minimumIntervalUs between vkQueuePresentKHR calls."
    */
   pthread_rwlock_rdlock(&g_ll2_lock);
   const struct nvk_ll2_state *s = ll2_find(swapchain);
   const bool     do_pace = s && s->min_interval_us > 0;
   const uint64_t min_ns  = do_pace ? (uint64_t)s->min_interval_us * 1000u : 0;
   const uint64_t last_ns = do_pace ? s->last_sleep_ns : 0;
   pthread_rwlock_unlock(&g_ll2_lock);

   uint64_t wake_target = 0;
   if (do_pace && last_ns) {
      uint64_t candidate = last_ns + min_ns;
      if (candidate > monotonic_ns())
         wake_target = candidate;
   }

   struct ll2_sleep_args *args = malloc(sizeof(*args));
   if (!args)
      return ll2_signal_sync(device, pSleepInfo->signalSemaphore,
                             pSleepInfo->value);

   *args = (struct ll2_sleep_args){
      .device         = device,
      .swapchain      = swapchain,
      .semaphore      = pSleepInfo->signalSemaphore,
      .value          = pSleepInfo->value,
      .wake_target_ns = wake_target,
   };

   pthread_t tid;
   if (pthread_create(&tid, NULL, ll2_sleep_thread, args)) {
      free(args);
      return ll2_signal_sync(device, pSleepInfo->signalSemaphore,
                             pSleepInfo->value);
   }

   pthread_detach(tid);
   return VK_SUCCESS;
}

VKAPI_ATTR void VKAPI_CALL
nvk_SetLatencyMarkerNV(VkDevice device,
                       VkSwapchainKHR swapchain,
                       const VkSetLatencyMarkerInfoNV *pLatencyMarkerInfo)
{
   uint64_t ts_us = monotonic_us();

   pthread_rwlock_wrlock(&g_ll2_lock);

   struct nvk_ll2_state *s = ll2_find(swapchain);
   if (!s) {
      /* Markers may arrive before SetLatencySleepModeNV in some engines. */
      s = ll2_get_or_create(swapchain);
      if (!s) {
         pthread_rwlock_unlock(&g_ll2_lock);
         return;
      }
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
   /* Out-of-band markers relate to driver/OS/GPU scheduling that we have
    * no visibility into; drop them rather than corrupt CPU-side fields. */
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
      VkLatencyTimingsFrameReportNV *dst = &pLatencyMarkerInfo->pTimings[i];

      /* Preserve caller's sType/pNext; copy only the timing payload. */
      dst->presentID                = rec->presentID;
      dst->inputSampleTimeUs        = rec->inputSampleTimeUs;
      dst->simStartTimeUs           = rec->simStartTimeUs;
      dst->simEndTimeUs             = rec->simEndTimeUs;
      dst->renderSubmitStartTimeUs  = rec->renderSubmitStartTimeUs;
      dst->renderSubmitEndTimeUs    = rec->renderSubmitEndTimeUs;
      dst->presentStartTimeUs       = rec->presentStartTimeUs;
      dst->presentEndTimeUs         = rec->presentEndTimeUs;
      /* No GPU/driver/OS timing available in this stub. */
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
