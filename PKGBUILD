# $Id: PKGBUILD 194006 2016-10-30 14:58:09Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=cdetect
pkgver=0.5.1
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file'
arch=('any')
url='https://github.com/xyproto/cdetect'
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/xyproto/cdetect#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  # Only uses the standard library
  go build
}

package() {
  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
