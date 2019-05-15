# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kbld-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Helps working with container images used in Kubernetes configuration files"
arch=('x86_64')
url="https://github.com/k14s/kbld"
license=('Apache')
source=("kbld_$pkgver::https://github.com/k14s/kbld/releases/download/v0.6.0/kbld-linux-amd64")
sha256sums=('605ae37ee1b2f38883b4e55614415d3798161e9eb766088a3504aa707d9cd4ff')

package() {
  install -Dm755 "kbld_$pkgver" "$pkgdir/usr/bin/kbld"
}
