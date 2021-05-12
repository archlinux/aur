# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=octant-bin
_srcname=octant
pkgdesc="A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
pkgver=0.20.0
pkgrel=1
arch=('x86_64')
url="https://github.com/vmware-tanzu/octant"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/vmware-tanzu/octant/releases/download/v${pkgver}/${_srcname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('6043f9907e47b0d7b8bd0682fbffbd4912f1e5da61069ac4d7c748ba7b39cc65')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}_${pkgver}_Linux-64bit/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
