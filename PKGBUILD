# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Some CNI network plugins, maintained by the containernetworking team"
arch=(x86_64)
url="https://github.com/containernetworking/plugins"
license=('Apache')
source=("https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-amd64-v${pkgver}.tgz")
sha256sums=('e9bfc78acd3ae71be77eb8f3e890cc9078a33cc3797703b8ff2fc3077a232252')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/opt/cni/bin
  install -Dm755 * "$pkgdir"/opt/cni/bin
  rm "$pkgdir"/opt/cni/bin/cni-plugins-linux-amd64-v${pkgver}.tgz
}

