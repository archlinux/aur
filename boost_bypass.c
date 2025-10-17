/*
    CUDA perfboost bypass, distributed under MIT License
        -- @Ristovski

    Each CUDA session is boosted to a fixed clock even when no real compute is being done,
    this in turn causes the GPU to run hotter, sometimes at considerably higher power.
    This preloadable library bypasses that by nuking the NV2080_CTRL_PERF_BOOST ioctl.
    
    Mainly useful for mpv/other video players that utilize hardware video decode (nvdec),
    as unlike on Windows, nvdec on linux utilizes CUDA for nvdec<->OpenGL/Vulkan interop.

    Usage:
      $ cc boost_bypass.c -O2 -Wextra -Wall -fPIC -shared -o boost_bypass.so -ldl
      $ LD_PRELOAD=/path/to/boost_bypass.so program

    Performance overhead is negligible at ~0.5ns per ioctl call on Ryzen 5700G
    (benchmarked with 5M dummy ioctls)

    Power improvement with mpv using nvdec on RTX 4070 Ti Super:
      1080p HDR vp9/HEVC: ~38W --> ~9W (GPU idles at ~6W fwiw)
         4k HDR vp9/HEVC: ~41W --> ~17W
*/

#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <stdint.h>

struct NV2080_CTRL_PERF_BOOST_PARAMS
{
    uint32_t flags;
    uint32_t duration;
};

struct NVOS54_PARAMETERS
{
    uint32_t hClient;
    uint32_t hObject;
    uint32_t cmd;
    uint32_t flags;
    uint64_t params __attribute__((aligned(8)));
    uint32_t paramsSize;
    uint32_t status;
};

#define _IOC_SIZESHIFT 16
#define _IOC_SIZEMASK ((1 << 14) - 1)
#define _IOC_SIZE(nr) (((nr) >> _IOC_SIZESHIFT) & _IOC_SIZEMASK)

// shaves off 1ns
#define unlikely(x) __builtin_expect(!!(x), 0)

static int (*real_ioctl)(int, unsigned long, void *) = NULL;

int __attribute__((visibility("default"))) ioctl(int fd, unsigned long op, void *arg)
{
    if (unlikely(!real_ioctl))
    {
        real_ioctl = (int (*)(int, unsigned long, void *))dlsym(RTLD_NEXT, "ioctl");
        __sync_synchronize();
    }

    if (unlikely(_IOC_SIZE(op) == sizeof(struct NVOS54_PARAMETERS)))
    {
        struct NVOS54_PARAMETERS *nvos = (struct NVOS54_PARAMETERS *)arg;

        if (nvos && unlikely(nvos->cmd == 0x2080200a))
        {
            struct NV2080_CTRL_PERF_BOOST_PARAMS *boost = (struct NV2080_CTRL_PERF_BOOST_PARAMS *)(uintptr_t)nvos->params;

            if (boost && boost->flags == 0x12 && boost->duration == UINT32_MAX)
            {
                //fprintf(stderr, "[+] CUDA perfboost bypassed\n");
                return 0;
            }
        }
    }

    return real_ioctl(fd, op, arg);
}
