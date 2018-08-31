# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=pulumi-bin
_pkgname=pulumi
pkgver=0.15.0
pkgrel=1
pkgdesc="A multi-language, multi-cloud development platform"
arch=('x86_64')
license=('Apache-2.0')
url="https://github.com/pulumi/pulumi"
source=("https://get.pulumi.com/releases/sdk/${_pkgname}-v${pkgver}-linux-${CARCH/x86_64/x64}.tar.gz")
sha256sums=('dd7cd67c25d0eb84a1f3c18cecf6865437cc37ee86a38d785476dd96cb7d3979')

package() {
  mkdir -p "${pkgdir}/usr/bin"

  install -m755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m755 "${srcdir}/${_pkgname}/bin/${_pkgname}-language-go" "${pkgdir}/usr/bin/${_pkgname}-language-go"
  install -m755 "${srcdir}/${_pkgname}/bin/${_pkgname}-language-nodejs" "${pkgdir}/usr/bin/${_pkgname}-language-nodejs"
  install -m755 "${srcdir}/${_pkgname}/bin/${_pkgname}-language-python" "${pkgdir}/usr/bin/${_pkgname}-language-python"
  install -m755 "${srcdir}/${_pkgname}/bin/${_pkgname}-language-python-exec" "${pkgdir}/usr/bin/${_pkgname}-language-python-exec"
  install -m755 "${srcdir}/${_pkgname}/bin/${_pkgname}-resource-pulumi-nodejs" "${pkgdir}/usr/bin/${_pkgname}-resource-pulumi-nodejs"
}
