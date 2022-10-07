# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=kubent-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Easily check your kubernetes cluster for use of deprecated APIs"
arch=('x86_64')
url="https://github.com/doitintl/kube-no-trouble"
license=('MIT')
source=(https://github.com/doitintl/kube-no-trouble/releases/download/$pkgver/kubent-$pkgver-linux-amd64.tar.gz)
md5sums=('ba707fca68c6dc54d7da41dbeab00c5a')

package() {
  install -Dm755 kubent -t "$pkgdir/usr/bin"
}

