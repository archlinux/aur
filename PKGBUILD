# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=ignite
_projname=cli
_pkgname=${_orgname}-${_projname}
pkgname=${_pkgname}-bin
pkgver=29.5.0
pkgrel=1
pkgdesc="The all-in-one platform to build, launch, and maintain any crypto application on a sovereign and secured blockchain"
arch=('x86_64' 'aarch64')
url="https://${_orgname}.com/${_projname}"
license=('Apache')
provides=(${_pkgname} starport)
conflicts=(${_pkgname} starport)
source_x86_64=("https://github.com/${_orgname}/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/${_orgname}/${_projname}/releases/download/v${pkgver}/${_orgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a42cd2121d4a638819e4b7126d1183ee657315924e09a41f5dfda74aa5c0e620')
sha256sums_aarch64=('d9e39599ccec1bada1e7fb1c9f26a184a0a8b3be095ea6ebe81db660b24bd79b')

package() {
    install -Dt "$pkgdir/usr/local/bin" "$_orgname"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_orgname" LICENSE
}
