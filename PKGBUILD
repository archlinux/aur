# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=leash-bin
_srcname=leash
pkgdesc="Leash wraps AI coding agents in containers and monitors their activity"
pkgver=1.1.6
pkgrel=1
arch=('x86_64')
url="https://github.com/strongdm/leash"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/strongdm/leash/releases/download/v${pkgver}/${_srcname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a4365bda3efb1b856b8287b00ce8d821330f6878402725dcfeca7affdb9e81fa')

package() {
    cd ${srcdir}
    tar --strip-components=1 -xzf ${_srcname}-${pkgver}.tar.gz

    install -Dm755 "${srcdir}/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
