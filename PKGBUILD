# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=octant-bin
_srcname=octant
pkgdesc="A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
pkgver=0.7.0
pkgrel=1
arch=('x86_64')
url="https://github.com/vmware/octant"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/vmware/octant/releases/download/v${pkgver}/${_srcname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('4e3dd545b196fa47dc1ecb8e93e6030e855d0d8977d46950a1203ad74bc48879')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}_${pkgver}_Linux-64bit/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
