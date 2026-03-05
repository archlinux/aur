# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=ignite
_projname=cli
_pkgname=${_orgname}-${_projname}
pkgname=${_pkgname}-bin
pkgver=29.9.0
pkgrel=1
pkgdesc="The all-in-one platform to build, launch, and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64' 'aarch64')
url="https://${_orgname}.com/${_projname}"
license=('Apache')
provides=(${_pkgname} starport)
conflicts=(${_pkgname} starport)
source_x86_64=("https://github.com/${_orgname}/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fc8819f0b5df5a6f3c1b76896f0dff5ad6d241ca99345f856b6612de0fb3e80c')
sha256sums_aarch64=('a065b9b2e6d314f0e87ad6098df14e1a4abe246ab0c55d4c0394701fdd38788d')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_orgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_orgname" LICENSE
}
