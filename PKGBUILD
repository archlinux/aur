# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=octant-bin
_srcname=octant
pkgdesc="A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
pkgver=0.5.1
pkgrel=1
arch=('x86_64')
url="https://github.com/vmware/octant"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/vmware/octant/releases/download/v${pkgver}/${_srcname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('a872fe57ecfbb57c8d0eaabfc0a9b74b68ec7d3d5273e79b8eeba512a4b2f07c')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}_${pkgver}_Linux-64bit/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
