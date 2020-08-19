# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ocm-cli-bin
pkgver=0.1.41
pkgrel=1
pkgdesc="This project contains the ocm command line tool that simplifies the use of the OCM API available at api.openshift.com."
url="https://github.com/openshift-online/ocm-cli"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=()
source=("https://github.com/openshift-online/ocm-cli/releases/download/v${pkgver}/ocm-linux-amd64")
sha256sums=('7fc2a5e5f26fad4910e77e9f68f138c4ca34df5b6fa934f1593dc39ae30f667d')

package() {
  install -Dm755 "${srcdir}/ocm-linux-amd64" "${pkgdir}/usr/bin/ocm"
}
