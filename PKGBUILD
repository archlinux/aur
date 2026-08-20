# Maintainer: missercatos <missercatos@gmail.com>

pkgname=ecapp
pkgver=0.3.1
pkgrel=1
pkgdesc="Terminal Translation Tool"
arch=('x86_64')
url="https://github.com/missercatos/ecapp"
license=('MIT')
depends=('glibc')
source=("https://github.com/missercatos/ecapp/releases/download/v$pkgver/ecapp-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('75dfebe6ed814d3b6cca5ed4067c383a1df0d90908602e3d7a8c660abdbc589a')

package() {
  install -Dm755 ecapp "$pkgdir/usr/bin/ecapp"
}
