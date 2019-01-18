# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="Some CNI network plugins, maintained by the containernetworking team"
arch=(x86_64)
url="https://github.com/containernetworking/plugins"
license=('Apache')
source=("https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-amd64-v${pkgver}.tgz")
sha256sums=('5f30e4c9090cbb5314452f4c2bcce48907f003b1614a7fc9615ddedbde31cf00')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/opt/cni/bin
  install -Dm755 * "$pkgdir"/opt/cni/bin
  rm "$pkgdir"/opt/cni/bin/cni-plugins-amd64-v${pkgver}.tgz
}

