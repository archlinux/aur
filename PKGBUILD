# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=kubent-bin
pkgver=0.7.1 # renovate: datasource=github-releases depName=doitintl/kube-no-trouble
pkgrel=1
pkgdesc="Easily check your kubernetes cluster for use of deprecated APIs"
arch=('x86_64')
url="https://github.com/doitintl/kube-no-trouble"
license=('MIT')
source=(https://github.com/doitintl/kube-no-trouble/releases/download/$pkgver/kubent-$pkgver-linux-amd64.tar.gz)
md5sums=('53666894b7bb4fa004b714ba3847c6d9')

package() {
  install -Dm755 kubent -t "$pkgdir/usr/bin"
}

