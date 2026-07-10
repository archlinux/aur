# linux-kira-lts

LTS kernel for Kira Linux

This kernel features build-in BCACHEFS.

And have few security mitigations disabled for performance shake on older hardware.
This kernel is NOT for extremely adversary environments.
Do not use it for security research that involves running dangerous untrusted code.
It is also generally not suitable for servers. Especially ones that host not trusted code.

We trying to make it fast and useful for relatively modern workstation hardware.
The goal is to provide wide HW support while stripping functions and drivers that is useless for x86 workstation.
Also meaningful performance optimizations.

This kernel lacks AGP support.
And has BPF syscall disabled (high security risk feature with extremely limited use for desktop)

Although some security mitigations disabled, we want to keep and enable thous that has meaning for general desktop.
For example running something in VM should provide expected level of isolation and security.

We looking for testing, and requests for missing features.
Suggestions on useless or dangerous features that may be removed also welcomed.
