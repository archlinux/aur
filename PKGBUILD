# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=ksonnet-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="A CLI-supported framework that streamlines writing and deployment of Kubernetes configurations to multiple clusters."
arch=('x86_64')
url="https://github.com/ksonnet/ksonnet"
license=('Apache-2.0')
provides=("ksonnet=${pkgver}")
conflicts=("ksonnet")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ksonnet/ksonnet/releases/download/v${pkgver}/ks_${pkgver}_linux_amd64.tar.gz")
md5sums=('ba5a4bf1c8e25a04b65fefe1d66edc36')
sha256sums=('e6cd45f257dc76a064aeb5360386e0063b947a35da0df2a99320ee73f7d95d98')

package() {
  cd "${srcdir}/ks_${pkgver}_linux_amd64"
  install -Dm755 ks "$pkgdir"/usr/bin/ks
}
