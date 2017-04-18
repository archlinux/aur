# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=whalebrew
pkgver=0.1.0
pkgrel=1
pkgdesc="Homebrew, but with Docker images"
arch=('x86_64')
url="https://github.com/bfirsh/whalebrew"
license=('Apache License 2.0')
provides=('whalebrew')
depends=('docker')
conflicts=('whalebrew')
source=("https://github.com/bfirsh/whalebrew/releases/download/${pkgver}/whalebrew-Linux-x86_64")
md5sums=('9a32d3e2eaf38fdd622935c2edad0a5f')
sha256sums=('f776cb3bc40fde0cd221e38159d2fa3a7933c4f8cf40a1dad257a09edb0e4af4')

package() {
  install -D -m755 "$srcdir"/whalebrew-Linux-x86_64 "$pkgdir/usr/bin/whalebrew"
}
