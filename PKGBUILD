# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=ocm-bin
pkgver=0.1.66
pkgrel=1
pkgdesc="CLI for the Red Hat OpenShift Cluster Manager"
url="https://github.com/openshift-online/ocm-cli"
arch=("x86_64")
provides=("ocm")
conflicts=("ocm")
license=("APACHE")

source=("https://raw.githubusercontent.com/openshift-online/ocm-cli/v${pkgver}/LICENSE.txt")
source_x86_64=("${pkgname}-${pkgver}::https://github.com/openshift-online/ocm-cli/releases/download/v${pkgver}/ocm-linux-amd64")

sha256sums=("0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594")
sha256sums_x86_64=("f0817ae854c0f5bbe2ae7f89c9ad925dd2dd2496b60e083fdf55de5c627407d2")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/ocm"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
}
