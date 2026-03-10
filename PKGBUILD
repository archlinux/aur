# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=akash-network
_pkgname=${_orgname%-*}
_reponame=node
pkgname=${_pkgname}-bin
pkgver=1.2.2
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
sha256sums_x86_64=('04fe70d1506d74b3dacf8ff0c908e9f93f2a5a4d89550336b8b282dd589a87bb')

package() {
    install -Dt "${pkgdir}/usr/bin" "${srcdir}/${_pkgname}"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
