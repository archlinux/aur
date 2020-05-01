# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-stamps
pkgver=2018.09.01
pkgrel=1
pkgdesc='Additional stamps for Tux Paint'
arch=('any')
url='http://tuxpaint.org/'
license=('GPL')
optdepends=('tuxpaint')
source=("https://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('d78f55e7fde6abc3fb1a79e6fed0114a2c0ad2edff7ee5f8db43fa23e61079ea')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  make -C "$pkgname-$pkgver" DATA_PREFIX="$pkgdir/usr/share/tuxpaint/" install-all
}

# vim: ts=2 sw=2 et:
