# Maintainer: missercatos <missercatos@gmail.com>

pkgname=ecapp-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal Translation Tool"
arch=('x86_64')
url="https://github.com/missercatos/ecapp"
license=('MIT')
depends=('glibc')
source=("https://github.com/missercatos/ecapp/releases/download/v$pkgver/ecapp-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('1d0cea8974250b54dd78e07fab9b83bfc68b508effdddbd0381c4a951a4dacf1')

package() {
  install -Dm755 ecapp "$pkgdir/usr/bin/ecapp"
}