# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.1.6
pkgrel=1
pkgdesc="Browse your kubernetes clusters in a casual way"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("https://github.com/AnatolyRugalev/kube-commander/releases/download/${pkgver}/kube-commander_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('7ccbd06b5bc670ef6a18c33ae361be308d999f7d40f9aa706f4ecc8e8023266a')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
}
