# Maintainer: missercatos <missercatos@gmail.com>

pkgname=ecapp
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal Translation Tool"
arch=('x86_64')
url="https://github.com/missercatos/ecapp"
license=('MIT')
depends=('glibc')
source=("https://github.com/missercatos/ecapp/releases/download/v$pkgver/ecapp-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('3b5236b08ca8813bd9c4a70b4778679735e1aae716f3c0f12f963b9aa7377b7d')

package() {
  install -Dm755 ecapp "$pkgdir/usr/bin/ecapp"
}
