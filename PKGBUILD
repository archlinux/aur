# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Alex Stelmachonak <mail@ava1ar.me>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Manolis Tzanidakis
# Contributor: Leonid Isaev

pkgname=autofs
pkgver=5.1.9
pkgrel=5.1
pkgdesc='A kernel-based automounter for Linux'
arch=('x86_64')
url='https://www.kernel.org/pub/linux/daemons/autofs/'
license=('GPL2')
depends=('libxml2')
makedepends=('libldap' 'krb5' 'kmod' 'sssd' 'libnsl' 'rpcsvc-proto' 'systemd')
optdepends=('krb5: for LDAP support'
            'sssd: for SSSD integration')
backup=('etc/autofs/auto.master'
        'etc/autofs/auto.misc'
        'etc/autofs/auto.net'
        'etc/autofs/auto.smb'
        'etc/autofs/autofs.conf'
        'etc/autofs/autofs_ldap_auth.conf'
        'etc/default/autofs')
_mirror='https://mirrors.edge.kernel.org'
_mirrorpath="${_mirror}/pub/linux/daemons/${pkgname}/v5"
source=("${_mirrorpath}/${pkgname}-${pkgver}.tar.xz"
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/autofs-5.1.9.tar.sign
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/patch_order_5.1.9{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-update-configure.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-ldap_parse_page_control-check.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-crash-in-make_options_string.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-Fix-incompatible-function-pointer-types-in-cyrus-sasl-module.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-always-recreate-credential-cache.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-changelog.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-amd-external-mount-error-handling.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-amd-external-mount-mount-handling.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-dont-free-ext-mount-if-mounted.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-amd-function-do_program_mount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-amd-function-umount_amd_ext_mount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-add-flags-argument-to-amd-do_program_mount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-amd-cache-options-not-copied.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-add-flags-argument-to-amd-do_program_mount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-seperate-amd-mount-and-entry-flags.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-make-ioctl-ops-timeout-handle-per-dentry-expire.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-refactor-amd-mount-options-handling.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-add-some-unimplemented-amd-map-options.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-get-parent-multi-mount-check-in-try_remount.patch{,.sign}
        https://mirrors.edge.kernel.org/pub/linux/daemons/autofs/v5/patches-5.2.0/autofs-5.1.9-fix-deadlock-in-remount.patch{,.sign}
        'libxml-parser.patch')
# gpg key for Ian Kent <raven@themaw.net>, the maintainer of autofs
sha256sums=('87e6af6a03794b9462ea519781e50e7d23b5f7c92cd59e1142c85d2493b3c24b'
            'SKIP'
            'ef6abcb1a164b5474c41e9d4de1cafcda769173e7f60d80ed90e75e4f3209f12'
            'SKIP'
            'b42ca5d2fa681062c69e90e48860e1077fe9b9d82dc1c84ece0e0a0803419326'
            'SKIP'
            '89e8e0b398afa9df49e7d2f7d38464063eae9b87c4bf13a01dee07c3b251e9cf'
            'SKIP'
            'd437ba38d958a6bc383cf2ed4f397f8f6fcdb22f661bc0e42f140aae26ea2c0c'
            'SKIP'
            '0cf9d836765d3df70994c281278b2f068f15914b03a36c7b897f8fbcd82bd27e'
            'SKIP'
            '6a9a86ad1903843276e8bb6ae0cbe5c20ed25ef7c3147f980501c24b5ffbba01'
            'SKIP'
            'ea63ce377522ee5e1a9792c6deb6deb3f9cba50b6906a3f7517f12570d89125c'
            'SKIP'
            'ff99c00e61e1660533a614f81aa82fb7272a5ca9a188faa4618d9f3f28769714'
            'SKIP'
            '831947144e9a7bb0b8e07a5b275f0b2a5daeed0530649383535189f059d8088a'
            'SKIP'
            '1f9009ff797d7a5b9b7efca1c87378cd984a3958e5531f246069448a660c2a69'
            'SKIP'
            '9b8349c642da92f46ab049f0cd9b36ae137606a56c0f48734e0d7ca60da10d94'
            'SKIP'
            '2ae9900e999b0c169520c3debe0e523dc508b5f46e702702b6f15e9a783b1050'
            'SKIP'
            '24182d4ba5caa811af215a167a26c44e112b25e859d8a2cd78b6a12537e65756'
            'SKIP'
            '74aad250627178e72ce209eb84d49cca4c24d2716e32e0432604388e0812b336'
            'SKIP'
            '24182d4ba5caa811af215a167a26c44e112b25e859d8a2cd78b6a12537e65756'
            'SKIP'
            'a3fabb89b3baf6992fca86e7bd3e454a837d5b1e7f559f1b92fed5e44197c7ed'
            'SKIP'
            '8eb1234737d56e395afad39b37641d24de2646f59dbe4dd80349c2be55227d3e'
            'SKIP'
            '1e73c735e68380fe7036bb4fc2c558f7215e83cb7f81fb8924b96bfd049dbb73'
            'SKIP'
            '502720dae86d9637b1f97a15f859b6e1bf354fd2db6fda008111de651dbec43c'
            'SKIP'
            '12186634015296c62481099f31bb5e926fae3d66d0ee85cdfedf047d43bff8d0'
            'SKIP'
            'cb254d6832e95e2f77b4bcb76e541a2c0a33b68c3dc1735ee7f3bf43df227f6f'
            'SKIP'
            '7df5e67262c9064d4b6e6ab68d7350f278ce8d09b3cb56a5030e7c1b0c70bb79')
validpgpkeys=('CD0A6E3CBB6768800B0736A8E7677380F54FD8A9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for line in $( cat ../patch_order_5.1.9 ); do
	  patch --forward --strip=1 --input=../${line}
  done

  patch -p0 < ../libxml-parser.patch

  sed -i -e 's|/etc/auto.misc|/etc/autofs/auto.misc|' \
         -e 's|/etc/auto.master.d|/etc/autofs/auto.master.d|' samples/auto.master

  sed -i -e "/^#include <linux\/fs.h>$/d" modules/parse_amd.c
  sed -i -e "/^#include <linux\/fs.h>$/d" modules/parse_sun.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
	--sysconfdir=/etc/autofs \
	--sbindir=/usr/bin \
	--with-mapdir=/etc/autofs \
	--with-confdir=/etc/default \
	--without-hesiod \
	--enable-ignore-busy \
	--with-libtirpc \
	--with-systemd
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make INSTALLROOT="${pkgdir}" install install_samples

  install -dm755 "$pkgdir/etc/autofs/auto.master.d"
}
