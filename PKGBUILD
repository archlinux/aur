# $Id: PKGBUILD 194006 2016-10-30 14:58:09Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=elfinfo
pkgver=0.4
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file + basic info'
arch=('any')
url='http://elfinfo.roboticoverlords.org/'
license=('MIT')
makedepends=('go')
source=("https://github.com/xyproto/elfinfo/archive/0.4.tar.gz")
sha256sums=('0bceab04e0e73abf15e0d07cca2923779517386cbd6394b1e970d8d950ad646d')

build() {
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
