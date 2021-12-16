# Maintainer: erdii <me@erdii.net>

pkgname=calicoctl-bin
pkgver=3.21.2
pkgrel=1
pkgdesc='command line tool to manage Calico resources and perform administrative functions'
arch=('x86_64')
url="https://projectcalico.docs.tigera.io/getting-started/clis/calicoctl/install"
license=('Apache')
provides=('calicoctl')
source=("${pkgname}-${pkgver}::https://github.com/projectcalico/calicoctl/releases/download/v${pkgver}/calicoctl-linux-amd64")
sha256sums=('d495edfc254e00f008ef6872422a31ef5f442a1ff96bcb724dd2df86ef75b7e3')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/calicoctl"
}
# vim:set ts=2 sw=2 et:
