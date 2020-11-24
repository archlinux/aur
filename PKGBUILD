# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=octant-bin
_srcname=octant
pkgdesc="A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
pkgver=0.16.2
pkgrel=1
arch=('x86_64')
url="https://github.com/vmware-tanzu/octant"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/vmware-tanzu/octant/releases/download/v${pkgver}/${_srcname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('ff8db21bb32fdad5fb44883df19cd95a5cc0a8b196954ba0141b8eba9111e4c9')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}_${pkgver}_Linux-64bit/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
