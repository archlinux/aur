# Maintainer: missercatos <missercatos@gmail.com>

pkgname=ecapp-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Terminal Translation Tool"
arch=('x86_64')
url="https://github.com/missercatos/ecapp"
license=('MIT')
depends=('glibc')
source=("https://github.com/missercatos/ecapp/releases/download/v$pkgver/ecapp-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('30c3572b28d82e46255446cc091fa64e26a4dcd533a89cda8d7bd64ce09aa33a')

package() {
  install -Dm755 ecapp "$pkgdir/usr/bin/ecapp"
}