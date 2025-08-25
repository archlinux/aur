# Maintainer: axrona
# Description: A terminal wrap tool inspired by Spotify Wrapped

pkgname=terminalwrap
pkgver=2.0.1
pkgrel=1
pkgdesc="A terminal wrap tool inspired by Spotify Wrapped"
arch=('any')
url="https://github.com/axrona/terminalwrap"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/axrona/terminalwrap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  go build -o terminalwrap main.go

}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 terminalwrap "$pkgdir/usr/bin/terminalwrap"

}
