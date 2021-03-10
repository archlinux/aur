# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ocm-cli-bin
pkgver=0.1.48
pkgrel=1
pkgdesc="This project contains the ocm command line tool that simplifies the use of the OCM API available at api.openshift.com."
url="https://github.com/openshift-online/ocm-cli"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=()
source=("ocm-linux-amd64-${pkgver}::https://github.com/openshift-online/ocm-cli/releases/download/v${pkgver}/ocm-linux-amd64")
sha256sums=('5daa455481ed847578f6e64298d029717c774981202fc6a83d61b2790c38511b')

package() {
  install -Dm755 "${srcdir}/ocm-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/ocm"
}
