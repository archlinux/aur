# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=libuhd-firmware
pkgver=4.9.0.0
pkgrel=1
pkgdesc="Universal Software Radio Peripheral (USRP) userspace firmware"
arch=('any')
url="https://files.ettus.com/manual/"
license=('GPL-3.0-or-later')
depends=('libuhd')
source=("https://github.com/EttusResearch/uhd/releases/download/v$pkgver/uhd-images_$pkgver.tar.xz")
sha256sums=('1e5c508d334ce2b1164e42040cda5a6a010f1ac03a711ad691bcbe6377d58fa4')

package() {
  cd "$srcdir/uhd-images_$pkgver"
  install -d "$pkgdir/usr/share/uhd/images/"
  cp -r * "$pkgdir/usr/share/uhd/images/"
}

