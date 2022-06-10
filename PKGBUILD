# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=ignite
_projname=cli
_pkgname=${_orgname}-${_projname}
pkgname=${_pkgname}-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="The all-in-one platform to build, launch, and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64' 'aarch64')
url="https://${_orgname}.com/${_projname}"
license=('Apache')
provides=(${_pkgname} starport)
conflicts=(${_pkgname} starport)
source_x86_64=("https://github.com/${_orgname}-hq/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}-hq/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6df209f31a8a5fd1af2113c0a39692525ec51c5d9ac4ba49c26630b972ab3cc8')
sha256sums_aarch64=('57e0beb894bf6f7cc5e4e27af7d5106db315b14bdf8e1bfdff81c3c526c731e2')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_orgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_orgname" LICENSE
}
