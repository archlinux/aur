# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.1.5
pkgrel=1
pkgdesc="Browse your kubernetes clusters in a casual way"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("https://github.com/AnatolyRugalev/kube-commander/releases/download/${pkgver}/kube-commander_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('a592e8dd19a1f0d9965c5c90a341c5058bd35a9c645ac6a322515bdcd6580fd6')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
}
