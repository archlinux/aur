# $Id: PKGBUILD 194006 2016-10-30 14:58:09Z arodseth $
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=elfinfo
pkgver=0.6
pkgrel=1
pkgdesc='Detect which compiler version was used for compiling an ELF file'
arch=('any')
url='http://elfinfo.roboticoverlords.org/'
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/xyproto/elfinfo#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  go build
}

package() {
  install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
