# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Some CNI network plugins, maintained by the containernetworking team"
arch=(x86_64)
url="https://github.com/containernetworking/plugins"
license=('Apache')
source=("https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-amd64-v${pkgver}.tgz")
sha256sums=('6ecc5c7dbb8e4296b0d0d017e5440618e19605b9aa3b146a2c29af492f299dc7')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/opt/cni/bin
  install -Dm755 * "$pkgdir"/opt/cni/bin
  rm "$pkgdir"/opt/cni/bin/cni-plugins-amd64-v${pkgver}.tgz
}

