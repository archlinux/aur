# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=ksonnet-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="A CLI-supported framework that streamlines writing and deployment of Kubernetes configurations to multiple clusters."
arch=('x86_64')
url="https://github.com/ksonnet/ksonnet"
license=('Apache-2.0')
provides=("ksonnet=${pkgver}")
conflicts=("ksonnet")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ksonnet/ksonnet/releases/download/v${pkgver}/ks_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5d96fcde3c515769067287abfa1965f8aa489dd617a1773d8231ed08a54d4843')

package() {
  cd "${srcdir}/ks_${pkgver}_linux_amd64"
  install -Dm755 ks "$pkgdir"/usr/bin/ks
}
