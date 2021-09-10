# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=octant-bin
_srcname=octant
pkgdesc="A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
pkgver=0.24.0
pkgrel=1
arch=('x86_64')
url="https://github.com/vmware-tanzu/octant"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/vmware-tanzu/octant/releases/download/v${pkgver}/${_srcname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('3a1c0b3b96becbd42c7a653c4331a638c290aa650cfa0dfdb4b149a0d0ee594e')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}_${pkgver}_Linux-64bit/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
