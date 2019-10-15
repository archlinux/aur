# Maintainer: Erik Dubois <erikdubois@gmail.com>
pkgname=gitfiend
_pkgname=GitFiend
pkgver=0.19.5
pkgrel=1
pkgdesc='A Git client designed for humans'
arch=('x86_64')
license=('custom')
url='https://gitfiend.com'
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://gitfiend.com/resources/${_pkgname}_${pkgver}_amd64.deb")
md5sums=('b742138f63bb3f0615c9229dcb0fe4bf')
package() {
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
}