# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=unixday
pkgver=0.1
pkgrel=1
pkgdesc='Utility for dealing with unix days'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/unixday'
license=('MIT')
makedepends=('go' 'git')
source=("git://github.com/xyproto/unixday.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  go build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
