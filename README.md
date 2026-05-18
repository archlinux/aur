# Nordix - ananicy-cpp Optimized Build

## My vision of an optimized system is built on this.

 > **don't put trash in the CPU memory pipeline** </br> _jimmy Källhagen_

---

# STATEMENT
If you think that a system that only uses 4GB of RAM is more optimized than a system that uses 20GB, you are wrong, but there is an aspect to this, an inefficient system can be noted by an abnormally high amount of RAM usage, think Microsoft, this can be directly compared to a Linux system and here this rule does not apply since Windows is an old legacy system that is not efficient. Instead, if we take an efficient system, you will always get a faster computer the more efficiently you can use RAM, that is why ZFS is such a killer in terms of performance, it is truly a devops dream.

If we take a closer look at how the large extreme systems are run (servers), then NVME/HHD/SSD is only storage space and RAM is workspace, this is key to building the fastest system on the planet without a doubt

CPU cache is much faster than RAM, so getting all standard processes as small as possible here means that all other processes will run much faster.

And that's what this optimization is all about

---

**28%/42% more Optimized**

## Goal
Minimize the cache footprint of `ananicy-cpp`, a process scheduler daemon that wakes periodically to scan and re-nice processes. Since it resides in cache while sleeping, every byte of cache it occupies evicts data from performance-critical applications (games, compilation, rendering). The goal is to make it as small as possible to reduce cache pollution.

---

## Optimization Strategy
- **`-Os`** instead of `-O3`/`-O2` — optimize for size, not speed (daemon is IO-bound, sleeps 99% of the time)
- **`-march=native -mtune=native`** — target the build machine's CPU
- **`-flto=full`** — full link-time optimization across all translation units
- **`-fdata-sections -ffunction-sections`** — place each function/data in its own section so `--gc-sections` can strip unused code
- **`--gc-sections --icf=all`** — remove dead code and merge identical functions at link time
- **`-falign-functions=1 -falign-loops=1`** — no alignment padding (every padding byte is a stolen cache line)
- **`-fno-unroll-loops`** — prevents code bloat from loop unrolling
- **`-fomit-frame-pointer`** — one less instruction per function call
- **`-fmerge-all-constants`** — deduplicate identical constants
- **`-fno-plt`** — faster internal function calls, smaller PLT
- **`--strip-all --build-id=none`** — remove all symbols and metadata

---

## Build Fixes Required
The project has issues with newer compilers (missing POSIX headers):
- Added `-include unistd.h` and `-D_GNU_SOURCE` for missing `getpid()` and `mkostemp()` declarations
- CMake's `StandardProjectSettings` and `configure_linker` override user flags, so flags must be forced via `CMAKE_C_FLAGS`/`CMAKE_CXX_FLAGS` set at the end of `CMakeLists.txt`

---

## Results

| Version | .text (code) | Cache lines | Alignment |
|---------|-------------|-------------|-----------|
| **AUR/GIT (standard)** | 467 KB | ~7,472 | 64 bytes |
| **Arch repo (previous installed)** | 378 KB | ~6,048 | 64 bytes |
| **Optimized build (running)** | **273 KB** | **~4,378** | **16 bytes** |

---

## Improvement over AUR/GIT
- **-42%** smaller .text section (467 KB → 273 KB)
- **~3,094 fewer cache lines** evicted per wake cycle

---

## Improvement over Arch repo
- **-28%** smaller .text section (378 KB → 273 KB)
- **~1,670 fewer cache lines** evicted per wake cycle

 
---

## Practical Impact
Each time ananicy-cpp wakes (every few seconds by default), it pulls its code into L1/L2/L3 instruction cache. With the optimized build:
- **Less cache eviction** of the currently running heavy process
- **Lower latency** when returning to the foreground application
- **Reduced micro-stutter** in latency-sensitive workloads like gaming

---

## Flags Used
```Fish
# Common flags
-include unistd.h -D_GNU_SOURCE
-march=native -mtune=native
-Os -pipe -fno-plt
-fmerge-all-constants -fomit-frame-pointer
-fno-unroll-loops
-falign-functions=1 -falign-loops=1
-fno-math-errno -fno-trapping-math
-fstack-protector -D_FORTIFY_SOURCE=1
-fdata-sections -ffunction-sections
-flto=full
```

# Linker flags
```Fish
-flto=full -fuse-ld=lld
-Wl,-O3,--relax,--gc-sections,--strip-all
-Wl,--lto-O3
-Wl,--lto-whole-program-visibility
-Wl,--icf=all
-Wl,-z,now -Wl,-z,relro
-Wl,--build-id=none
```
