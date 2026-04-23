# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=kubefwd-bin
_srcname=kubefwd
pkgdesc="kubefwd is a command line utility built to port forward some or all pods within a Kubernetes namespace."
pkgver=1.25.14
pkgrel=1
arch=('x86_64')
url="https://github.com/txn2/kubefwd"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/txn2/kubefwd/releases/download/v${pkgver}/kubefwd_Linux_x86_64.tar.gz")
sha256sums=('ebaeab597a8f868e3c7b0d64755837b17b64a7a7e929dfbd6b35868362fc1f69')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
}
