# Maintainer: missercatos <missercatos@gmail.com>

pkgname=ecapp
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal Translation Tool"
arch=('x86_64')
url="https://github.com/missercatos/ecapp"
license=('MIT')
depends=('glibc')
source=("https://github.com/missercatos/ecapp/releases/download/v$pkgver/ecapp-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('6f500de243cd721b049d224aa6bd6c71284f692843cd3e47545f0e5810cb2df7')

package() {
  install -Dm755 ecapp "$pkgdir/usr/bin/ecapp"
}
