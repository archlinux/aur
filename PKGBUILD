# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kubefwd-bin
_srcname=kubefwd
pkgdesc="kubefwd is a command line utility built to port forward some or all pods within a Kubernetes namespace."
pkgver=1.20.0
pkgrel=1
arch=('x86_64')
url="https://github.com/txn2/kubefwd"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/txn2/kubefwd/releases/download/${pkgver}/kubefwd_Linux_x86_64.tar.gz")
sha256sums=('b7e69207349e15d0df5243dae933db214daae7cd1a06047ff87d3bd4cc1f3884')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
