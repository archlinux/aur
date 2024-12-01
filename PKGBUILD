# Maintainer: Noel Jacob < noeljacob91 at gmail dot com >

_orgname=akash-network
_pkgname=akash-provider
_reponame=provider
_binname=provider-services
pkgname=${_pkgname}-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Provider CLI for Akash Network. Use to deploy client applications."
arch=('x86_64')
url="https://github.com/${_orgname}/${_reponame}"
license=('Apache-2.0')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://raw.githubusercontent.com/${_orgname}/${_reponame}/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/${_orgname}/${_reponame}/releases/download/v${pkgver}/${_binname}_${pkgver}_linux_amd64.zip")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('d53de0e9b85bcca85ce57eb42002bd24f6a5e8cf03f25af48fb0f769f0966727')

package() {
    install -Dt "${pkgdir}/usr/bin" "${srcdir}/${_binname}"
    install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
