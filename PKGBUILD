# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=kubent-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Easily check your kubernetes cluster for use of deprecated APIs"
arch=('x86_64')
url="https://github.com/doitintl/kube-no-trouble"
license=('MIT')
source=(https://github.com/doitintl/kube-no-trouble/releases/download/$pkgver/kubent-$pkgver-linux-amd64.tar.gz)
md5sums=('3b0f87769ecd63b0ad6135fa841b52b2')

package() {
  install -Dm755 kubent -t "$pkgdir/usr/bin"
}

