# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=qemu-debootstrap
pkgver=5.2
pkgrel=1
pkgdesc='QEMU debootstrap wrapper'
arch=('any')
url='https://salsa.debian.org/qemu-team/qemu'
license=('GPL')
depends=('qemu' 'debootstrap')
source=(
'https://salsa.debian.org/qemu-team/qemu/-/raw/master/debian/qemu-debootstrap'
'https://salsa.debian.org/qemu-team/qemu/-/raw/master/debian/qemu-debootstrap.1'
)
sha1sums=('2eef819f34f609f59e0c754ca698369e6ad82fda'
          '8f4b540c52db9f2753dd1ef62507497f5f844027')

package() {
  install -Dm755 ${srcdir}/qemu-debootstrap ${pkgdir}/usr/bin/qemu-debootstrap
  install -Dm755 ${srcdir}/qemu-debootstrap.1 ${pkgdir}/usr/share/doc/qemu-debootstrap/qemu-debootstrap.1
}

# vim: ts=2 sw=2 et:
