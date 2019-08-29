# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=octant-bin
_srcname=octant
pkgdesc="A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
pkgver=0.6.0
pkgrel=1
arch=('x86_64')
url="https://github.com/vmware/octant"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/vmware/octant/releases/download/v${pkgver}/${_srcname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('cc78cdab179a499f67f8cc3eb5b54785630a46bf18eb08132658e4037d314b3d')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}_${pkgver}_Linux-64bit/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
