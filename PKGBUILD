# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=up
pkgver=0.2.1
pkgrel=1
license=('Apache')
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"
url="https://github.com/akavel/up"
arch=('x86_64')
provides=('up')
conflicts=('up-git')
source_x86_64=("${url}/releases/download/v${pkgver}/up")
md5sums_x86_64=('3635f80809a13d208b9b4c7a9ae1b8e8')

package() {
  install -Dm755 "up" "$pkgdir/usr/bin/up"
}
