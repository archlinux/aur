# Maintainer: Thorsten Toepper <atsutane-aur at freethoughts dot de>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Based on core/systemd by Christian Hesse <mail@eworm.de>

pkgbase=systemd-git
pkgname=('systemd-git'
         'systemd-libs-git'
         'systemd-resolvconf-git'
         'systemd-sysvcompat-git'
         'systemd-tests-git'
         'systemd-ukify-git')
pkgdesc='systemd (git version)'
pkgver=257.devel.r76353.fb4c82b643b
pkgrel=1
arch=('x86_64')
license=('LGPL-2.1-or-later')
url='https://www.github.com/systemd/systemd'
makedepends=('acl' 'cryptsetup' 'docbook-xsl' 'gperf' 'lz4' 'xz' 'pam' 'libelf'
             'intltool' 'iptables' 'kmod' 'libarchive' 'libcap' 'libidn2' 'libgcrypt'
             'libmicrohttpd' 'libxcrypt' 'libxslt' 'util-linux' 'linux-api-headers'
             'python-jinja' 'python-lxml' 'quota-tools' 'shadow' 'git'
             'meson' 'libseccomp' 'pcre2' 'audit' 'kexec-tools' 'libxkbcommon'
             'bash-completion' 'p11-kit' 'systemd' 'libfido2' 'tpm2-tss' 'rsync'
             'bpf' 'libbpf' 'clang' 'llvm' 'curl' 'gnutls' 'python-pyelftools'
             'libpwquality' 'qrencode' 'lib32-gcc-libs' 'python-pefile')
conflicts=("mkinitcpio<38-1")
options=('!strip')
source=("$pkgbase-stable::git+https://github.com/systemd/systemd"
        '0001-Use-Arch-Linux-device-access-groups.patch'
        # bootloader files
        'arch.conf'
        'loader.conf'
        'splash-arch.bmp'::'https://gitlab.archlinux.org/archlinux/packaging/packages/systemd/-/raw/main/splash-arch.bmp'
        # pam configuration
        'systemd-user.pam'
        # pacman / libalpm hooks
        'systemd-hook'
        '20-systemd-sysusers.hook'
        '30-systemd-binfmt.hook'
        '30-systemd-catalog.hook'
        '30-systemd-daemon-reload-system.hook'
        '30-systemd-daemon-reload-user.hook'
        '30-systemd-hwdb.hook'
        '30-systemd-sysctl.hook'
        '30-systemd-tmpfiles.hook'
        '30-systemd-udev-reload.hook'
        '30-systemd-update.hook')
sha512sums=('SKIP'
            '54fa62f9d1c4a45a4d0300ba0c235f9655e60ff88734504ec19f6fae2404ce3656026054f3fdd43c47db826e43d566d91b3a6a3ebebed7675da215b42bd7c846'
            '61032d29241b74a0f28446f8cf1be0e8ec46d0847a61dadb2a4f096e8686d5f57fe5c72bcf386003f6520bc4b5856c32d63bf3efe7eb0bc0deefc9f68159e648'
            'c416e2121df83067376bcaacb58c05b01990f4614ad9de657d74b6da3efa441af251d13bf21e3f0f71ddcb4c9ea658b81da3d915667dc5c309c87ec32a1cb5a5'
            '5a1d78b5170da5abe3d18fdf9f2c3a4d78f15ba7d1ee9ec2708c4c9c2e28973469bc19386f70b3cf32ffafbe4fcc4303e5ebbd6d5187a1df3314ae0965b25e75'
            'b90c99d768dc2a4f020ba854edf45ccf1b86a09d2f66e475de21fe589ff7e32c33ef4aa0876d7f1864491488fd7edb2682fc0d68e83a6d4890a0778dc2d6fe19'
            '3cb8f88c1bffc753d0c540be5d25a0fdb9224478cca64743b5663340f2f26b197775286e6e680228db54c614dcd11da1135e625674a622127681662bec4fa886'
            '299dcc7094ce53474521356647bdd2fb069731c08d14a872a425412fcd72da840727a23664b12d95465bf313e8e8297da31259508d1c62cc2dcea596160e21c5'
            '0d6bc3d928cfafe4e4e0bc04dbb95c5d2b078573e4f9e0576e7f53a8fab08a7077202f575d74a3960248c4904b5f7f0661bf17dbe163c524ab51dd30e3cb80f7'
            '2b50b25e8680878f7974fa9d519df7e141ca11c4bfe84a92a5d01bb193f034b1726ea05b3c0030bad1fbda8dbb78bf1dc7b73859053581b55ba813c39b27d9dc'
            'a436d3f5126c6c0d6b58c6865e7bd38dbfbfb7babe017eeecb5e9d162c21902cbf4e0a68cf3ac2f99815106f9fa003b075bd2b4eb5d16333fa913df6e2f3e32a'
            '190112e38d5a5c0ca91b89cd58f95595262a551530a16546e1d84700fc9644aa2ca677953ffff655261e8a7bff6e6af4e431424df5f13c00bc90b77c421bc32d'
            'a1661ab946c6cd7d3c6251a2a9fd68afe231db58ce33c92c42594aedb5629be8f299ba08a34713327b373a3badd1554a150343d8d3e5dfb102999c281bd49154'
            '9426829605bbb9e65002437e02ed54e35c20fdf94706770a3dc1049da634147906d6b98bf7f5e7516c84068396a12c6feaf72f92b51bdf19715e0f64620319de'
            'da7a97d5d3701c70dd5388b0440da39006ee4991ce174777931fea2aa8c90846a622b2b911f02ae4d5fffb92680d9a7e211c308f0f99c04896278e2ee0d9a4dc'
            'a50d202a9c2e91a4450b45c227b295e1840cc99a5e545715d69c8af789ea3dd95a03a30f050d52855cabdc9183d4688c1b534eaa755ebe93616f9d192a855ee3'
            '825b9dd0167c072ba62cabe0677e7cd20f2b4b850328022540f122689d8b25315005fa98ce867cf6e7460b2b26df16b88bb3b5c9ebf721746dce4e2271af7b97')

pkgver() {
  cd "$pkgbase-stable"
  # Upstream versioning is incompatible with pacman's version comparisons, one
  # way or another. So we replace dashes and tildes to make sure pacman's
  # version comparing does the right thing for rc versions:
  local _major=`sed 's/~/./g' meson.version`
  printf "%s.r%s.%s" "${_major}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgbase}-stable"

  # Replace cdrom/dialout/tape groups with optical/uucp/storage
  patch -Np1 -i ../0001-Use-Arch-Linux-device-access-groups.patch
}

build() {
  local _timeservers=({0..3}.arch.pool.ntp.org)
  local _nameservers=(
    # We use these public name services, ordered by their privacy policy (hopefully):
    #  * Cloudflare (https://1.1.1.1/)
    #  * Quad9 (https://www.quad9.net/)
    #  * Google (https://developers.google.com/speed/public-dns/)
    '1.1.1.1#cloudflare-dns.com'
    '9.9.9.9#dns.quad9.net'
    '8.8.8.8#dns.google'
    '2606:4700:4700::1111#cloudflare-dns.com'
    '2620:fe::9#dns.quad9.net'
    '2001:4860:4860::8888#dns.google'
  )

  local _meson_options=(
    -Dversion-tag="${pkgver}-${pkgrel}-arch"
    -Dvcs-tag=true
    -Dshared-lib-tag="${pkgver}-${pkgrel}"
    -Dmode=developer

    -Dapparmor=disabled
    -Dbootloader=enabled
    -Dxenctrl=disabled
    -Dbpf-framework=enabled
    -Dima=false
    -Dinstall-tests=true
    -Dlibidn2=enabled
    -Dlz4=enabled
    -Dman=enabled
    -Dnscd=false
    -Dselinux=disabled

    # We disable DNSSEC by default, it still causes trouble:
    # https://github.com/systemd/systemd/issues/10579

    -Ddbuspolicydir=/usr/share/dbus-1/system.d
    -Ddefault-dnssec=no
    -Ddefault-hierarchy=unified
    -Ddefault-kill-user-processes=false
    -Ddefault-locale='C.UTF-8'
    -Dlocalegen-path=/usr/bin/locale-gen
    -Ddns-over-tls=openssl
    -Dfallback-hostname='archlinux'
    -Dnologin-path=/usr/bin/nologin
    -Dntp-servers="${_timeservers[*]}"
    -Ddns-servers="${_nameservers[*]}"
    -Drpmmacrosdir=no
    -Dsysvinit-path=
    -Dsysvrcnd-path=

    -Dsbat-distro='arch'
    -Dsbat-distro-summary='Arch Linux AUR'
    -Dsbat-distro-pkgname="${pkgname}"
    -Dsbat-distro-version="${pkgver}"
    -Dsbat-distro-url="https://aur.archlinux.org/pkgbase/${pkgname}"
  )

  arch-meson "${pkgbase}-stable" build "${_meson_options[@]}"

  #meson compile -C build --verbose
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_systemd-git() {
  pkgdesc='system and service manager'
  pkgdesc+=' (git version)'
  license+=(
    'CC0-1.0' # siphash
    'GPL-2.0-or-later' # udev
    'MIT-0' # documentation and config files
  )
  depends=("systemd-libs-git=${pkgver}"
           'acl' 'libacl.so' 'bash' 'cryptsetup' 'libcryptsetup.so' 'dbus'
           'dbus-units' 'kbd' 'kmod' 'hwdata' 'libcap' 'libcap.so'
           'libgcrypt' 'libxcrypt' 'libcrypt.so' 'libidn2' 'lz4' 'pam'
           'libelf' 'libseccomp' 'libseccomp.so' 'util-linux' 'libblkid.so'
           'libmount.so' 'xz' 'pcre2' 'audit' 'libaudit.so'
           'openssl' 'libcrypto.so' 'libssl.so')
  provides=('nss-myhostname' "systemd-tools=${pkgver}" "udev=${pkgver}")
  provides+=("systemd=${pkgver}")
  replaces=('nss-myhostname' 'systemd-tools' 'udev')
  conflicts=('nss-myhostname' 'systemd-tools' 'udev')
  conflicts+=('systemd')
  optdepends=('libmicrohttpd: systemd-journal-gatewayd and systemd-journal-remote'
              'quota-tools: kernel-level quota management'
              'systemd-sysvcompat: symlink package to provide sysvinit binaries'
              "systemd-ukify-git=${pkgver}: combine kernel and initrd into a signed Unified Kernel Image"
              'polkit: allow administration as unprivileged user'
              'python: Unified Kernel Image with ukify'
              'curl: systemd-journal-upload, machinectl pull-tar and pull-raw'
              'gnutls: systemd-journal-gatewayd and systemd-journal-remote'
              'qrencode: show QR codes'
              'iptables: firewall features'
              'libarchive: convert DDIs to tarballs'
              'libbpf: support BPF programs'
              'libpwquality: check password quality'
              'libfido2: unlocking LUKS2 volumes with FIDO2 token'
              'libp11-kit: support PKCS#11'
              'tpm2-tss: unlocking LUKS2 volumes with TPM2')
  backup=(etc/pam.d/systemd-user
          etc/systemd/coredump.conf
          etc/systemd/homed.conf
          etc/systemd/journald.conf
          etc/systemd/journal-remote.conf
          etc/systemd/journal-upload.conf
          etc/systemd/logind.conf
          etc/systemd/networkd.conf
          etc/systemd/oomd.conf
          etc/systemd/pstore.conf
          etc/systemd/resolved.conf
          etc/systemd/sleep.conf
          etc/systemd/system.conf
          etc/systemd/timesyncd.conf
          etc/systemd/user.conf
          etc/udev/iocost.conf
          etc/udev/udev.conf)
  install=systemd.install

  meson install -C build --destdir "${pkgdir}"

  # we'll create this on installation
  rmdir "$pkgdir"/var/log/journal/remote

  # runtime libraries shipped with systemd-libs
  install -d -m0755 systemd-libs/lib/
  mv "$pkgdir"/usr/lib/lib{nss,systemd,udev}*.so* systemd-libs/lib/
  mv "$pkgdir"/usr/lib/pkgconfig systemd-libs/lib/pkgconfig
  mv "$pkgdir"/usr/include systemd-libs/include
  mv "$pkgdir"/usr/share/man/man3 systemd-libs/man3

  # ukify shipped in separate package
  install -d -m0755 systemd-ukify/{bin,systemd,man1,install.d}
  mv "$pkgdir"/usr/bin/ukify systemd-ukify/bin/
  mv "$pkgdir"/usr/lib/systemd/ukify systemd-ukify/systemd/
  mv "$pkgdir"/usr/share/man/man1/ukify.1 systemd-ukify/man1/
  # we move the ukify hook itself, but keep 90-uki-copy.install in place,
  # because there are other ways to generate UKIs w/o ukify, e.g. w/ mkinitcpio
  mv "$pkgdir"/usr/lib/kernel/install.d/60-ukify.install systemd-ukify/install.d

  # manpages shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/share/man/man8/{halt,poweroff,reboot,shutdown}.8

  # executable (symlinks) shipped with systemd-sysvcompat
  rm "$pkgdir"/usr/bin/{halt,init,poweroff,reboot,shutdown}

  # files shipped with systemd-resolvconf
  rm "$pkgdir"/usr/{bin/resolvconf,share/man/man1/resolvconf.1}

  # tests shipped with systemd-tests (for upstream)
  install -d -m0755 systemd-tests/
  mv "$pkgdir"/usr/lib/systemd/tests systemd-tests/

  # avoid a potential conflict with [core]/filesystem
  rm "$pkgdir"/usr/share/factory/etc/{issue,nsswitch.conf}
  sed -i -e '/^C \/etc\/nsswitch\.conf/d' \
    -e '/^C \/etc\/issue/d' "$pkgdir"/usr/lib/tmpfiles.d/etc.conf

  # ship default policy to leave services disabled
  echo 'disable *' >"$pkgdir"/usr/lib/systemd/system-preset/99-default.preset

  # The group 'systemd-journal' is allocated dynamically and may have varying
  # gid on different systems. Let's install with gid 0 (root), systemd-tmpfiles
  # will fix the permissions for us. (see /usr/lib/tmpfiles.d/systemd.conf)
  install -d -o root -g root -m 2755 "$pkgdir"/var/log/journal

  # match directory owner/group and mode from polkit
  install -d -o root -g 102 -m 0750 "$pkgdir"/usr/share/polkit-1/rules.d

  # add example bootctl configuration
  install -D -m0644 arch.conf "$pkgdir"/usr/share/systemd/bootctl/arch.conf
  install -D -m0644 loader.conf "$pkgdir"/usr/share/systemd/bootctl/loader.conf
  install -D -m0644 splash-arch.bmp "$pkgdir"/usr/share/systemd/bootctl/splash-arch.bmp

  # pacman hooks
  install -D -m0755 systemd-hook "$pkgdir"/usr/share/libalpm/scripts/systemd-hook
  install -D -m0644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook

  # overwrite the systemd-user PAM configuration with our own
  install -D -m0644 systemd-user.pam "$pkgdir"/etc/pam.d/systemd-user

  # create a directory for cryptsetup keys
  install -d -m0700 "$pkgdir"/etc/cryptsetup-keys.d

  # handle uncommon license
  install -d -m0755 "$pkgdir/usr/share/licenses/$pkgbase"
  ln -s -t "$_" /usr/share/doc/systemd/LICENSES/MIT-0.txt
}

package_systemd-libs-git() {
  pkgdesc='systemd client libraries'
  pkgdesc+=' (git version)'
  depends=('glibc' 'gcc-libs' 'libcap' 'libgcrypt' 'lz4' 'xz' 'zstd')
  license+=(
    'CC0-1.0' # siphash
    'GPL-2.0-or-later WITH Linux-syscall-note' # src/basic/linux/*
  )
  provides=('libsystemd' 'libsystemd.so' 'libudev.so')
  provides+=("systemd-libs=${pkgver}")
  conflicts=('libsystemd')
  conflicts+=('systemd-libs')
  replaces=('libsystemd')

  install -d -m0755 "$pkgdir"/usr/share/man
  mv systemd-libs/lib "$pkgdir"/usr/lib
  mv systemd-libs/include "$pkgdir"/usr/include
  mv systemd-libs/man3 "$pkgdir"/usr/share/man/man3
}

package_systemd-resolvconf-git() {
  pkgdesc='systemd resolvconf replacement (for use with systemd-resolved)'
  pkgdesc+=' (git version)'
  depends=("systemd-git=${pkgver}")
  provides=('openresolv' 'resolvconf')
  provides+=("systemd-resolvconf=${pkgver}")
  conflicts=('resolvconf')
  conflicts+=('systemd-resolvconf')

  install -d -m0755 "$pkgdir"/usr/bin
  ln -s resolvectl "$pkgdir"/usr/bin/resolvconf

  install -d -m0755 "$pkgdir"/usr/share/man/man1
  ln -s resolvectl.1.gz "$pkgdir"/usr/share/man/man1/resolvconf.1.gz
}

package_systemd-sysvcompat-git() {
  pkgdesc='sysvinit compat for systemd'
  pkgdesc+=' (git version)'
  conflicts=('sysvinit')
  conflicts+=('systemd-sysvcompat')
  depends=("systemd-git=${pkgver}")
  provides=("systemd-sysvcompat=${pkgver}")

  install -D -m0644 -t "$pkgdir"/usr/share/man/man8 \
    build/man/{halt,poweroff,reboot,shutdown}.8

  install -d -m0755 "$pkgdir"/usr/bin
  ln -s ../lib/systemd/systemd "$pkgdir"/usr/bin/init
  for tool in halt poweroff reboot shutdown; do
    ln -s systemctl "$pkgdir"/usr/bin/$tool
  done
}

package_systemd-tests-git() {
  pkgdesc='systemd tests'
  pkgdesc+=' (git version)'
  conflicts=('systemd-tests')
  provides=("systemd-tests=${pkgver}")
  depends=("systemd=${pkgver}")

  install -d -m0755 "$pkgdir"/usr/lib/systemd
  mv systemd-tests/tests "$pkgdir"/usr/lib/systemd/tests
}

package_systemd-ukify-git() {
  pkgdesc='Combine kernel and initrd into a signed Unified Kernel Image'
  pkgdesc+=' (git version)'
  conflicts=('systemd-ukify')
  provides=('ukify')
  provides+=("systemd-ukify=$pkgver")
  depends=("systemd-git=$pkgver" 'binutils' 'python-cryptography' 'python-pefile')
  optdepends=('python-pillow: Show the size of splash image'
              'sbsigntools: Sign the embedded kernel')

  install -d -m0755 "$pkgdir"/usr/{lib/kernel,share/man}
  mv systemd-ukify/bin "$pkgdir"/usr/bin
  mv systemd-ukify/systemd "$pkgdir"/usr/lib/systemd
  mv systemd-ukify/man1 "$pkgdir"/usr/share/man/man1
  mv systemd-ukify/install.d "$pkgdir"/usr/lib/kernel/install.d
}

# vim:ft=sh syn=sh et sw=2:
