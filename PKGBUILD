# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=kubent-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Easily check your kubernetes cluster for use of deprecated APIs"
arch=('x86_64')
url="https://github.com/doitintl/kube-no-trouble"
license=('MIT')
source=(https://github.com/doitintl/kube-no-trouble/releases/download/$pkgver/kubent-$pkgver-linux-amd64.tar.gz)
md5sums=('4e7febb849e733f0ebb9882c673c13d9')

package() {
  install -Dm755 kubent -t "$pkgdir/usr/bin"
}

