# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=ignite
_projname=cli
_pkgname=${_orgname}-${_projname}
pkgname=${_pkgname}-bin
pkgver=0.21.2
pkgrel=1
pkgdesc="The all-in-one platform to build, launch, and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64' 'aarch64')
url="https://${_orgname}.com/${_projname}"
license=('Apache')
provides=(${_pkgname} starport)
conflicts=(${_pkgname} starport)
source_x86_64=("https://github.com/${_orgname}-hq/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}-hq/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c79e7119a0e14881336b92a5191cba861130c80a5a21bb0f0aa8f79c4c237204')
sha256sums_aarch64=('25512912e665473b52ad0f76ea64487aa197f7ce52575b1b553b88f020ecc0b2')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_orgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_orgname" LICENSE
}
