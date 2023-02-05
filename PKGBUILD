# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.25.0
pkgrel=1
pkgdesc='command line tool to manage Calico resources and perform administrative functions'
arch=('x86_64')
url="https://projectcalico.docs.tigera.io/maintenance/clis/calicoctl/install"
license=('Apache')
provides=('calicoctl')
source=("${pkgname}-${pkgver}::https://github.com/projectcalico/calico/releases/download/v${pkgver}/calicoctl-linux-amd64")
sha256sums=('5a464075ccbaa8715882de6b32fe82b41488e904fa66b19c48ee6388cf48b1b8')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
