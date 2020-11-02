# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up-bin
pkgver=0.4
pkgrel=1
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('x86_64')
provides=('up')
conflicts=('up-git' 'up')
source_x86_64=("${url}/releases/download/v${pkgver}/up")
md5sums_x86_64=('14bab5d22144c0a7c802b651de29fbac')

package() {
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}
