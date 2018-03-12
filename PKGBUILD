# Maintainer: Matthias Loibl <mail@matthiasloibl.com>
pkgname=ksonnet-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A CLI-supported framework that streamlines writing and deployment of Kubernetes configurations to multiple clusters."
arch=('x86_64')
url="https://github.com/ksonnet/ksonnet"
license=('Apache-2.0')
provides=("ksonnet=${pkgver}")
conflicts=("ksonnet")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ksonnet/ksonnet/releases/download/v${pkgver}/ks_${pkgver}_linux_amd64.tar.gz")
md5sums=('8ddd6d2f2660263c22ef82ab34efbe5f')
sha256sums=('e4a408169547479bd2d904821c161b3f81a5e6abc6d56bb69dbacc1e17f53957')

package() {
  cd "${srcdir}/ks_${pkgver}_linux_amd64"
  install -Dm755 ks "$pkgdir"/usr/bin/ks
}
