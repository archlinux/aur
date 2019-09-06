# Maintainer: rawkode <rawkode@pm.me>

pkgname=pulumi-bin
_pkgname=pulumi
pkgver=1.0.0
pkgrel=1
pkgdesc="A multi-language, multi-cloud development platform"
arch=('x86_64')
license=('Apache-2.0')
url="https://github.com/pulumi/pulumi"
source=("https://get.pulumi.com/releases/sdk/${_pkgname}-v${pkgver}-linux-${CARCH/x86_64/x64}.tar.gz")
sha256sums=('f3fbb0b1986bb8f96a4dfc889d1bb57d4c21720293ecbef1f92a98928baaffc4')

package() {
  mkdir -p "${pkgdir}/usr/bin"

  install -m755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-language-go" "${pkgdir}/usr/bin/${_pkgname}-language-go"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-language-nodejs" "${pkgdir}/usr/bin/${_pkgname}-language-nodejs"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-language-python" "${pkgdir}/usr/bin/${_pkgname}-language-python"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-language-python-exec" "${pkgdir}/usr/bin/${_pkgname}-language-python-exec"
  install -m755 "${srcdir}/${_pkgname}/${_pkgname}-resource-pulumi-nodejs" "${pkgdir}/usr/bin/${_pkgname}-resource-pulumi-nodejs"
}
