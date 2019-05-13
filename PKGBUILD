# Maintainer: Ryan Eschinger <ryanesc[at]gmail[dot]com>

pkgname=kbld-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Helps working with container images used in Kubernetes configuration files"
arch=('x86_64')
url="https://github.com/k14s/kbld"
license=('Apache')
source=("kbld_$pkgver::https://github.com/k14s/kbld/releases/download/v0.5.0/kbld-linux-amd64")
sha256sums=('e82867e73444ed83627de198124cff29ce46a3b3d304fa54b005596ae605f2b5')

package() {
  install -Dm755 "kbld_$pkgver" "$pkgdir/usr/bin/kbld"
}
