# linux-xanmod-bore

A simple patchset to include BORE scheduler by Masahito Suzuki into Xanmod kernel with cfs patches from tkg. Tickrate customizations are set inside the PKGBUILD file, together with other Xanmod customizations.

# Changes from Xanmod

- BORE scheduler
- O3 optimization (can be disabled)
- Enabled the use of all CPU cores for compilation
- Disabled NUMA by default
- Choose your PER_VMA_LOCK settings from standard or none (standard is default)
- Choose your tickrate HZ from 1000, 500, 300, 250, or 100. (500 is default)
- Choose your tickrate handling from tickless, idle, or constant (tickless is default)
- Choose your Preemption Model from preemptible, voluntary, or server (preemptible is default)

## Misc. changes

- Changed all msg2 to echo
- Changed all kernver to \_kernver
- Changed all modulesdir to \_modulesdir
- Changed all builddir to \_builddir

# Credits

Xanmod - http://www.xanmod.org/

BORE Scheduler - https://github.com/firelzrd/bore-scheduler

Glitched cfs patch - https://github.com/Frogging-Family/linux-tkg
