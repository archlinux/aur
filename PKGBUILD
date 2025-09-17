# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=akash-network
_pkgname=${_orgname%-*}
_reponame=node
pkgname=${_pkgname}-bin
pkgver=0.38.5
pkgrel=1
pkgdesc="A secure, transparent, and peer-to-peer cloud computing network"
arch=('x86_64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://raw.githubusercontent.com/${_orgname}/${_reponame}/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
sha256sums=('f88a0de961dddc3410a201b6174c54190fdd912310df24ea8292c675981a39cd')
sha256sums_x86_64=('581556a9af2494fc397e32f115015652a72363e347cf49439d3e96cf015601de')

package() {
    install -Dt "${pkgdir}/usr/bin" "${srcdir}/${_pkgname}"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
