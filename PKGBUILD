# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=octant-bin
_srcname=octant
pkgdesc="A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
pkgver=0.25.0
pkgrel=1
arch=('x86_64')
url="https://github.com/vmware-tanzu/octant"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/vmware-tanzu/octant/releases/download/v${pkgver}/${_srcname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('a90e489858133ffdb88c64b2ed68a1013720eb966e36958e8008ba8d6dce2e76')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}_${pkgver}_Linux-64bit/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
