/*
 * libcamera-ipu6: wait-libcamhal-shm
 *
 * Polls the SysV shm key libcamhal uses (0x43414d == "CAM") and exits 0
 * once we can either look it up or it doesn't exist -- i.e. once any
 * conflicting holder (most often GDM's greeter wireplumber, running
 * under a DynamicUser= transient uid) has released it.
 *
 * Used as ExecStartPre for pipewire and wireplumber so that libcamhal's
 * dlopen-time constructor cannot race with GDM and end up wedged in
 * "Fail to allocate shared memory by shmget" / EACCES state.
 *
 * Exits 0 on success, after timeout, or any unexpected errno (the goal
 * is to never block the unit indefinitely; a successful start with a
 * cameraless wireplumber is preferable to a hung session).
 */
#include <errno.h>
#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <time.h>

int main(void) {
    const key_t LIBCAMHAL_KEY = 0x43414d;
    const struct timespec poll = { .tv_sec = 0, .tv_nsec = 100 * 1000 * 1000 }; /* 100ms */
    const int max_iters = 100; /* 10 seconds total */

    for (int i = 0; i < max_iters; i++) {
        int id = shmget(LIBCAMHAL_KEY, 8192, 0640);
        if (id >= 0) {
            fprintf(stderr, "wait-libcamhal-shm: key 0x%x accessible (id=%d), proceeding\n",
                    (unsigned)LIBCAMHAL_KEY, id);
            return 0;
        }
        if (errno == ENOENT) {
            fprintf(stderr, "wait-libcamhal-shm: key 0x%x absent, proceeding\n",
                    (unsigned)LIBCAMHAL_KEY);
            return 0;
        }
        if (errno != EACCES) {
            fprintf(stderr, "wait-libcamhal-shm: unexpected errno=%d, proceeding\n", errno);
            return 0;
        }
        nanosleep(&poll, NULL);
    }
    fprintf(stderr,
            "wait-libcamhal-shm: key 0x%x still held by another uid after %d iterations, proceeding\n",
            (unsigned)LIBCAMHAL_KEY, max_iters);
    return 0;
}
