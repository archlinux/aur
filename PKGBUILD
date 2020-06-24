# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.2.1
pkgrel=1
pkgdesc="Browse your kubernetes clusters in a casual way"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("https://github.com/AnatolyRugalev/kube-commander/releases/download/${pkgver}/kube-commander_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('4fd4efb76f48e2086ecbdd43c75d136a57726fd0c322bd32f87d0580fe703589')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
}
