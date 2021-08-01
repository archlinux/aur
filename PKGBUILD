# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="datree"
pkgver=0.2.1
pkgrel=1
pkgdesc="Prevent Kubernetes misconfigurations from reaching production (again triumph)! Datree is a CLI tool to ensure K8s manifests and Helm charts follow best practices as well as your organization’s policies."
arch=('x86_64')
url="https://github.com/datreeio/datree"
license=('Apache-2.0')
source=("https://github.com/datreeio/${pkgname}/releases/download/${pkgver}/${pkgname}-cli_${pkgver}_Linux_x86_64.zip")
sha256sums=('472b44e591c4e67e24179d939a6a46bb81f54614df6423b379498f0f98e15fe9')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  install -Dm755 "${pkgname}" "$pkgdir/usr/local/bin/${pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
