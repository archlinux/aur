# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ocm-cli-bin
pkgver=0.1.74
pkgrel=1
pkgdesc="This project contains the ocm command line tool that simplifies the use of the OCM API available at api.openshift.com."
url="https://github.com/openshift-online/ocm-cli"
license=('Apache')
arch=('x86_64')
depends=()
conflicts=()
source=("ocm-linux-amd64-${pkgver}::https://github.com/openshift-online/ocm-cli/releases/download/v${pkgver}/ocm-linux-amd64")
sha256sums=('ef16fd73d2faa2ef131de0708af2d6f57853a8a95411e5e6ddc3d97831d973cf')

package() {
  install -Dm755 "${srcdir}/ocm-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/ocm"
}
