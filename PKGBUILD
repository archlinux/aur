# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kbld-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Helps working with container images used in Kubernetes configuration files"
arch=('x86_64')
url="https://github.com/k14s/kbld"
license=('Apache')
source=("kbld_$pkgver::https://github.com/k14s/kbld/releases/download/v0.7.0/kbld-linux-amd64")
sha256sums=('a67eb6eeeff63ac77d34c2c86b0a3fa97f69a9d3f8c9d34c20036fa79cb4214d')

package() {
  install -Dm755 "kbld_$pkgver" "$pkgdir/usr/bin/kbld"
}
