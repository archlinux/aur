# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=ksonnet-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A CLI-supported framework that streamlines writing and deployment of Kubernetes configurations to multiple clusters."
arch=('x86_64')
url="https://github.com/ksonnet/ksonnet"
license=('Apache-2.0')
provides=("ksonnet=${pkgver}")
conflicts=("ksonnet")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ksonnet/ksonnet/releases/download/v${pkgver}/ks_${pkgver}_linux_amd64.tar.gz")
md5sums=('b8145ce03a382bde7fcace1410b10405')
sha256sums=('058ada432f5eb9f9b17e16cd45f8ce35da935c1bec9ed102b5330089c7e23df6')

package() {
  cd "${srcdir}/ks_${pkgver}_linux_amd64"
  install -Dm755 ks "$pkgdir"/usr/bin/ks
}
