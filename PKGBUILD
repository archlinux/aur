# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=leash-bin
_srcname=leash
pkgdesc="Leash wraps AI coding agents in containers and monitors their activity"
pkgver=1.1.5
pkgrel=2
arch=('x86_64')
url="https://github.com/strongdm/leash"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/strongdm/leash/releases/download/v${pkgver}/${_srcname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('62e644553133c34d79f0fe6d0bd3ac685ae7f1210f0c1bea8a9c0f60ccd170da')

package() {
    cd ${srcdir}
    tar --strip-components=1 -xzf ${_srcname}-${pkgver}.tar.gz

    install -Dm755 "${srcdir}/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
