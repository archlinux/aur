# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up-bin
pkgver=0.3.2
pkgrel=1
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('x86_64')
provides=('up')
conflicts=('up-git' 'up')
source_x86_64=("${url}/releases/download/v${pkgver}/up")
md5sums_x86_64=('43badba881ed97bd3ed651b240fdd824')

package() {
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}
