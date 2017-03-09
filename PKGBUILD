# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=go-xxd
pkgver=1.0
pkgrel=1
pkgdesc='Fast, standalone drop-in replacement for xxd'
arch=('x86_64' 'i686')
url='https://github.com/felixge/go-xxd/'
license=('unknown')
makedepends=('go' 'git' )
conflicts=('vim')
source=("git+https://github.com/felixge/go-xxd#commit=0e80be1")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  go build -x
}

package() {
  cd "$pkgname"

  install -Dm755 go-xxd "$pkgdir/usr/bin/xxd"
#  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
