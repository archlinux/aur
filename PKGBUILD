# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="Some CNI network plugins, maintained by the containernetworking team"
arch=(x86_64)
url="https://github.com/containernetworking/plugins"
license=('Apache')
source=("https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-amd64-v${pkgver}.tgz")
sha256sums=('bd682ffcf701e8f83283cdff7281aad0c83b02a56084d6e601216210732833f9')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/opt/cni/bin
  install -Dm755 * "$pkgdir"/opt/cni/bin
  rm "$pkgdir"/opt/cni/bin/cni-plugins-linux-amd64-v${pkgver}.tgz
}

