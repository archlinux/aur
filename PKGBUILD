# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=whalebrew
pkgver=0.3.1
pkgrel=1
pkgdesc="Homebrew, but with Docker images"
arch=('x86_64')
url="https://github.com/bfirsh/whalebrew"
license=('Apache License 2.0')
provides=('whalebrew')
depends=('docker')
conflicts=('whalebrew')
source=("https://github.com/bfirsh/whalebrew/releases/download/${pkgver}/whalebrew-Linux-x86_64")
sha256sums=('6b62b280e55a4349a367ff1e8967dc82e05116c99e04d8026f1dcf11cd2da65f')

package() {
  install -D -m755 "$srcdir"/whalebrew-Linux-x86_64 "$pkgdir/usr/bin/whalebrew"
}
