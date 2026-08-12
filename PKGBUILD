# Maintainer: missercatos <missercatos@gmail.com>

pkgname=ecapp
pkgver=0.2.0
pkgrel=1
pkgdesc="Terminal Translation Tool"
arch=('x86_64')
url="https://github.com/missercatos/ecapp"
license=('MIT')
depends=('glibc')
source=("https://github.com/missercatos/ecapp/releases/download/v$pkgver/ecapp-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('c5b0b0c1d53218620cd46fa77bb2977def03739d2e495b34482163bca180763b')

package() {
  install -Dm755 ecapp "$pkgdir/usr/bin/ecapp"
}
