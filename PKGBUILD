# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=ldfpcfix
pkgver=1.0
pkgrel=4
pkgdesc='Silence the "contains output sections" warning from /usr/bin/ld'
arch=(any)
url='https://github.com/xyproto/ldfpcfix'
license=('MIT')
makedepends=(go git)
source=("git+https://github.com/xyproto/ldfpcfix#tag=v$pkgver")
sha256sums=(SKIP)

build() {
  cd $pkgname
  go build
}

package() {
  install -Dm755 $pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim: ts=2 sw=2 et:
