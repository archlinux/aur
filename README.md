
Arch linux `linux-xanmod` derived kernel with hardware enablement patches for ASUS ROG laptops and ACPI backports from mainline enabling s0ix power states

**Suspend is currently unstable, this is a known upstream issue that I'm working with an AMD developer to resolve. All available patches to help stabilize suspend are currently in this kernel, we're waiting on upstream to finish writing patches to fix this. It mostly works but for now expect resume to crash periodically.**

Up to date information on suspend can be found in the '#suspend-issues' channel on the asus-linux discord: https://discord.gg/qUUm9cWW

More information about s0ix enablement status can be found here:
  - https://gitlab.freedesktop.org/drm/amd/-/issues/1629
  - https://gitlab.freedesktop.org/drm/amd/-/issues/1652
  - https://gitlab.freedesktop.org/drm/amd/-/issues/1230

Notes:

  - Xanmod builds with the performance governor as the default; this is great for performance but doesn't clock down as readily. Since this kernel package is mainly targeted at ROG laptop users I've switched the build config to default to the schedutil governor at boot time. I strongly suggest making a couple of bash aliases to make switching modes/governors easier; this allows you to easily boost performance or conserve battery power as needed.

    * `alias goboost='set -x; asusctl profile boost -t true -f boost; sudo cpupower frequency-set -g performance >&/dev/null; { set +x; } >&/dev/null'`
    * `alias gonormal='set -x; asusctl profile normal -t true -f normal; sudo cpupower frequency-set -g schedutil >&/dev/null; { set +x; } >&/dev/null'`
    * `alias gosilent='set -x; asusctl profile silent -t false -f silent; sudo cpupower frequency-set -g schedutil >&/dev/null; { set +x; } >&/dev/null'`

    * To switch performance profiles during a kernel build you'd run something like: `goboost; makepkg -Ccsr; gonormal`

  - UKSM can be enabled by building with `use_uksm=y makepkg ...` to perform fast deduplication on in-use memory.

    * WARNING: Don't enable UKSM *and* the multigenerational LRU together at runtime, this will cause crashes.
      The PKGBUILD disables lru_gen by default when UKSM is included in the build, switching both on at runtime will crash the system rather quickly.

  - Use the included `myconfig` script fragment to make minor changes to the kernel configuration during build.

  - We now build for the `x86-64-v3` target by default; this supports Haswell era and newer CPUs and should be ~10% more performant than a generic `x86_64` build while maintaining wide compatibility. This supports all recent ROG laptops, including Intel machines.
  - Package now requires GCC >= 11 to support the new default build target.
  - Suggested architecture build targets:

    * `_microarchitecture=14 makepkg ...` Zen2 optimization (AMD 4000 series CPUs, 2020 AMD ROG laptops)
    * `_microarchitecture=15 makepkg ...` Zen3 optimizationa (most AMD 5000 series CPUs, 2021 AMD ROG laptops)
    * `_microarchitecture=38 makepkg ...` Skylake optimization (Use this for [Comet Lake](https://wiki.gentoo.org/wiki/Safe_CFLAGS#Skylake.2C_Kaby_Lake.2C_Kaby_Lake_R.2C_Coffee_Lake.2C_Comet_Lake))
    * `_microarchitecture=92 makepkg ...` x86-64-v2 for compatibility with older (2008 era) machines
    * `_microarchitecture=93 makepkg ...` x86-64-v3 (this is the default, most machines from 2013/2014 and newer are compatible)
    * `_microarchitecture=98 makepkg ...` Intel -march=native
    * `_microarchitecture=99 makepkg ...` AMD -march=native 

  - GA503QR has an ACPI table BIOS bug in version 410 and below that prevents the machine from putting the second drive to sleep and breaks the suspend code path.
    Errors related to StorageD3Enable issues will look like the following in `dmesg` or the system journal:
    ```log
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: I/O 460 QID 3 timeout, aborting
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: I/O 461 QID 3 timeout, aborting
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: I/O 462 QID 3 timeout, aborting
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: I/O 463 QID 3 timeout, aborting
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: I/O 0 QID 0 timeout, reset controller
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: Abort status: 0x371
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: Abort status: 0x371
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: Abort status: 0x371
    Jun 19 18:56:26 arch-zephyrus kernel: nvme nvme0: Abort status: 0x371
    ```
    See this project on github for a short how-to on fixing this yourself while you wait for ASUS to publish a fixed BIOS:
    https://github.com/foundObjects/GA503QR-StorageD3Enable-DSDT-Patch

    If you're experiencing this yourself *please* go make a vendor support ticket with ASUS and ask them to fix their BIOS.

  - GA401QM may be having other ACPI/firmware related suspend/wake issues

  - If you're experiencing errors like the following during resume/wake please visit the gitlab links below.
    ```log
    [16305.645129] amdgpu 0000:04:00.0: amdgpu: failed to write reg 28b4 wait reg 28c6
    [16318.651117] amdgpu 0000:04:00.0: amdgpu: failed to write reg 1a6f4 wait reg 1a706
    [16327.200382] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
    [16327.200439] amdgpu 0000:04:00.0: amdgpu: SMU is resuming...
    [16329.682185] amdgpu 0000:04:00.0: amdgpu: message: SetDriverDramAddrHigh (26) 	param: 0x000000f4 is timeout (no response)
    [16329.682191] amdgpu 0000:04:00.0: amdgpu: Failed to SetDriverDramAddr!
    [16329.682193] amdgpu 0000:04:00.0: amdgpu: Failed to setup smc hw!
    [16329.682195] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of IP block <smu> failed -62
    [16329.682461] amdgpu 0000:04:00.0: amdgpu: amdgpu_device_ip_resume failed (-62).
    [16329.682463] PM: dpm_run_callback(): pci_pm_resume+0x0/0xe0 returns -62
    [16329.682478] amdgpu 0000:04:00.0: PM: failed to resume async: error -62
    [16329.685538] PM: resume of devices complete after 37180.901 msecs
    [16329.685960] PM: resume devices took 37.182 seconds
    ```
    see:
    - https://gitlab.freedesktop.org/drm/amd/-/issues/1629
    - https://gitlab.freedesktop.org/drm/amd/-/issues/1652


Changes:

  - 5.13.2-1:   some early s0ix code has been merged into the stable tree, regenerated the s0ix support patch to include all s0ix related commits to date
  - 5.13.1-3:   new ACPI s0ix suport patch
  - 5.13.1-2:   squashed all s0ix commits through 2021-06-29 into a single patch
  - 5.13.0-1:   moved all config customizations into a `myconfig` script fragment, edit this before build to make config changes
  - 5.12.13-2:  hotfix: revert a couple of drm/amdgpu commits that snuck into stable that cause suspend failures with the new s0ix code
  - 5.12.12-2:  added 'Quirk PCI d3hot delay for AMD xhci' patch per GitLab discussion
  - 5.12.12-2:  added the 5.14 ACPI s0ix suspend patchset from upstream, suspend is mostly stable with some caveats: there seem to be a few machines with firmware issues that are still causing problems:
  - ~~Since 5.12.7 Suspend has been unstable on 2021 (Cezanne) machines, we're still looking for a solution as the patches we were using up until that point have become an unreliable fix. If this is an issue for you either disable suspend in `/etc/systemd/sleep.conf` or stay with 5.12.6 until a solution is found. You can find more information about the issue by tracking the kernel [bug report](https://gitlab.freedesktop.org/drm/amd/-/issues/1230#note_947255) or help investigate the issue with us [on Discord](https://discord.gg/JW7yywZn). This affects all 2020/2021 Ryzen laptops, not just ASUS machines.~~
  - ~~5.12.9-2: Big upstream suspend-related patch set update; this is mostly hidden from git history here because we're pulling patches out of the asus-linux fedora kernel repo during package build~~
  - ~~5.12.8-2: Updated upstream suspend patches~~
  - 5.12.8: Added Flow x13 audio patch
  - Added support for new GCC-11 microarchitecture feature targets, see [`choose-gcc-optimization.sh`](choose-gcc-optimization.sh) or [`PKGBUILD`](PKGBUILD) for details.

