# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kbld-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="kbld seamlessly incorporates image building and image pushing into your development and deployment workflows"
arch=('x86_64')
url="https://github.com/k14s/kbld"
license=('Apache')
source=("kbld_$pkgver::https://github.com/k14s/kbld/releases/download/v0.11.0/kbld-linux-amd64")
sha256sums=('1029110ffa0263fb75a9deb25642f577bb9d5ee25b1a5b10db55310e05388569')

package() {
  install -Dm755 "kbld_$pkgver" "$pkgdir/usr/bin/kbld"
}
