# Maintainer: rawkode <rawkode@pm.me>

pkgname=pulumi-bin
_pkgname=pulumi
pkgver=1.1.0
pkgrel=1
pkgdesc="A multi-language, multi-cloud development platform"
arch=('x86_64')
license=('Apache-2.0')
url="https://github.com/pulumi/pulumi"
source=("https://get.pulumi.com/releases/sdk/${_pkgname}-v${pkgver}-linux-${CARCH/x86_64/x64}.tar.gz")
sha256sums=('4408766e7e732a0fd6208f7642d4735d3287b8257027f81bac4936a9fb4589e4')

package() {
  mkdir -p "${pkgdir}/usr/bin"

  install -m755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-language-go" "${pkgdir}/usr/bin/${_pkgname}-language-go"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-language-nodejs" "${pkgdir}/usr/bin/${_pkgname}-language-nodejs"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-language-python" "${pkgdir}/usr/bin/${_pkgname}-language-python"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-language-python-exec" "${pkgdir}/usr/bin/${_pkgname}-language-python-exec"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-resource-pulumi-nodejs" "${pkgdir}/usr/bin/${_pkgname}-resource-pulumi-nodejs"
}
