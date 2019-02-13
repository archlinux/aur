# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=sonobuoy-bin
_srcname=sonobuoy
pkgdesc="Sonobuoy is a diagnostic tool that makes it easier to understand the state of a Kubernetes cluster by running a set of Kubernetes conformance tests in an accessible and non-destructive manner."
pkgver=0.13.0
pkgrel=1
arch=('x86_64')
url="https://github.com/heptio/sonobuoy"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_srcname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0b10d412bfc3777267ffd83f161a8ce4a7fba321f28241574639dc9c2cad8150')

package() {
    cd ${srcdir}
    tar -xzf $_srcname-$pkgver.tar.gz
    install -Dm755 "$srcdir/$_srcname" "$pkgdir/usr/bin/$_srcname"
}
