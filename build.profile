#include <tunables/global>

profile makepkg-jail-build {
    signal (send, receive) peer="makepkg-jail-build//&makepkg-jail-setup",
    signal (send, receive) peer="makepkg-jail-setup//&makepkg-jail-build",

    # Read the explicitly mounted toolchain and configuration.
    /usr/ r,
    /usr/** mr,
    /usr/** ix,

    /etc/ r,
    /etc/** r,

    /var/lib/pacman/ r,
    /var/lib/pacman/** r,

    # Private writable locations supplied by the wrapper.
    /work/ rw,
    /work/** rwklmix,

    /home/ r,
    /home/build/ rw,
    /home/build/** rwklmix,

    /tmp/ rw,
    /tmp/** rwklmix,

    /var/tmp/ rw,
    /var/tmp/** rwklmix,

    /gnupg/ rw,
    /gnupg/** rwk,

    /etc/pacman.d/gnupg/ rw,
    /etc/pacman.d/gnupg/** rwk,

    # Namespace-local process information and minimal devices.
    / r,
    /proc/ r,
    /proc/** r,
    /dev/ r,
    /dev/null rw,
    /dev/zero rw,
    /dev/random r,
    /dev/urandom r,
    /dev/tty rw,
    /dev/ptmx rw,
    /dev/pts/ r,
    /dev/pts/** rw,

    /run/ r,

    # Used by compilers, fakeroot and subprocess management.
    signal (send, receive) peer=makepkg-jail-build,
    signal (receive) peer=unconfined,
    signal (receive) peer=makepkg-jail-setup,

    # The wrapper's network namespace controls online versus offline.
    network,
    unix,

    # No capability, mount, pivot_root, userns or profile-change
    # permission is granted to build processes.
}
