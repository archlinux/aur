# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ocm-cli-bin
pkgver=0.1.55
pkgrel=1
pkgdesc="This project contains the ocm command line tool that simplifies the use of the OCM API available at api.openshift.com."
url="https://github.com/openshift-online/ocm-cli"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=()
source=("ocm-linux-amd64-${pkgver}::https://github.com/openshift-online/ocm-cli/releases/download/v${pkgver}/ocm-linux-amd64")
sha256sums=('dc6c2880dada59ff2ac22675bac4dc749ced08c1cbad75c1981a058d830104e6')

package() {
  install -Dm755 "${srcdir}/ocm-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/ocm"
}
