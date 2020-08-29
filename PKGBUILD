# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.3.2
pkgrel=1
pkgdesc="Browse your kubernetes clusters in a casual way"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("https://github.com/AnatolyRugalev/kube-commander/releases/download/${pkgver}/kube-commander_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('c2d74fd0832704226abfa8a435838b40d2eeb8d3bf993f2d54eb37d7d24c7f11')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
}
