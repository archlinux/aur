# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=akash-network
_pkgname=${_orgname%-*}
_reponame=node
pkgname=${_pkgname}-bin
pkgver=0.22.3
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
sha256sums_x86_64=('f8ca2f8d248e7a7cdd83dc8fc9367e75d44e8f3dd1a260b5f7ad787e638e0f22')

package() {
    install -Dt "${pkgdir}/usr/bin" "${srcdir}/${_pkgname}"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
