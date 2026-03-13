# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ocm-cli-bin
pkgver=1.0.12
pkgrel=0
pkgdesc="This project contains the ocm command line tool that simplifies the use of the OCM API available at api.openshift.com."
url="https://github.com/openshift-online/ocm-cli"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=()
source=("ocm-linux-amd64-${pkgver}::https://github.com/openshift-online/ocm-cli/releases/download/v${pkgver}/ocm-linux-amd64")
sha256sums=('83197ad9ad83268da834f28a623c1ad58afe79ae70d57dc65a00beeb4ba7d5dc')

package() {
  install -Dm755 "${srcdir}/ocm-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/ocm"
}
