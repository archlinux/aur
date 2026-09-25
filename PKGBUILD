# Maintainer: missercatos <missercatos@gmail.com>

pkgname=ecapp-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Terminal Translation Tool"
arch=('x86_64')
url="https://github.com/missercatos/ecapp"
license=('MIT')
depends=('glibc')
source=("https://github.com/missercatos/ecapp/releases/download/v$pkgver/ecapp-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('6eb5ff78fc5b21e879213efdf64188845c57b2d77393e598059365d7ac5e808f')

package() {
  install -Dm755 ecapp "$pkgdir/usr/bin/ecapp"
}