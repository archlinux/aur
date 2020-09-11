# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ocm-cli-bin
pkgver=0.1.42
pkgrel=1
pkgdesc="This project contains the ocm command line tool that simplifies the use of the OCM API available at api.openshift.com."
url="https://github.com/openshift-online/ocm-cli"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=()
source=("https://github.com/openshift-online/ocm-cli/releases/download/v${pkgver}/ocm-linux-amd64")
sha256sums=('951f44b0775f4eb03a6b500d626cedf26e2547c4e6d704709f4d0b477d9523ff')

prepare() {
  rm -f "${srcdir}ocm-linux-amd64"
}

package() {
  install -Dm755 "${srcdir}/ocm-linux-amd64" "${pkgdir}/usr/bin/ocm"
}
