# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=leash-bin
_srcname=leash
pkgdesc="Leash wraps AI coding agents in containers and monitors their activity"
pkgver=1.1.7
pkgrel=1
arch=('x86_64')
url="https://github.com/strongdm/leash"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/strongdm/leash/releases/download/v${pkgver}/${_srcname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d813d5b85b164043ed6128618ba8b0de15b1d9deddb37a11d16f042a68d7da55')

package() {
    cd ${srcdir}
    tar --strip-components=1 -xzf ${_srcname}-${pkgver}.tar.gz

    install -Dm755 "${srcdir}/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
