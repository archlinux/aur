# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=ignite
_projname=cli
_pkgname=${_orgname}-${_projname}
pkgname=${_pkgname}-bin
pkgver=29.10.1
pkgrel=1
pkgdesc="The all-in-one platform to build, launch, and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64' 'aarch64')
url="https://${_orgname}.com/${_projname}"
license=('Apache')
provides=(${_pkgname} starport)
conflicts=(${_pkgname} starport)
source_x86_64=("https://github.com/${_orgname}/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('33caf7fd24d10aecad7654536fabb3416d9d222ec1e667452de4cc1ec16a26f7')
sha256sums_aarch64=('5674582aca89d3276bc419940dd1152e07161f25e9b6d8ffba16e1b155fee7c0')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_orgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_orgname" LICENSE
}
