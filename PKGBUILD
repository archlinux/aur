# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=ksonnet-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="A CLI-supported framework that streamlines writing and deployment of Kubernetes configurations to multiple clusters."
arch=('x86_64')
url="https://github.com/ksonnet/ksonnet"
license=('Apache-2.0')
provides=("ksonnet=${pkgver}")
conflicts=("ksonnet")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ksonnet/ksonnet/releases/download/v${pkgver}/ks_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fe76e414e5cba3f093e34e1b433f79cd53915e3153b68cff5ba3273cafd8a2a0')

package() {
  cd "${srcdir}/ks_${pkgver}_linux_amd64"
  install -Dm755 ks "$pkgdir"/usr/bin/ks
}
