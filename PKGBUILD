# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=octant-bin
_srcname=octant
pkgdesc="A web-based, highly extensible platform for developers to better understand the complexity of Kubernetes clusters."
pkgver=0.10.2
pkgrel=1
arch=('x86_64')
url="https://github.com/vmware-tanzu/octant"
license=('apache')
source=("$_srcname-$pkgver.tar.gz::https://github.com/vmware-tanzu/octant/releases/download/v${pkgver}/${_srcname}_${pkgver}_Linux-64bit.tar.gz")
sha256sums=('bae2cce082b160a64b379116e139ffcc6f0632d8ec68c9fda949af7104cab715')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}_${pkgver}_Linux-64bit/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
