# Maintainer: kamisaki <your-email@example.com>
# Description: A terminal wrap tool inspired by Spotify Wrapped

pkgname=terminalwrap
pkgver=2.0.0
pkgrel=1
pkgdesc="A terminal wrap tool inspired by Spotify Wrapped"
arch=('x86_64')
url="https://github.com/xeyossr/terminalwrap"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xeyossr/terminalwrap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  go build -o terminalwrap main.go

}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 terminalwrap "$pkgdir/usr/bin/terminalwrap"

}
