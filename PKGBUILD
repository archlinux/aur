# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=sonobuoy-bin
_srcname=sonobuoy
pkgdesc="Sonobuoy is a diagnostic tool that makes it easier to understand the state of a Kubernetes cluster by running a set of Kubernetes conformance tests in an accessible and non-destructive manner."
pkgver=0.14.1
pkgrel=1
arch=('x86_64')
url="https://github.com/heptio/sonobuoy"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_srcname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('bb1bb4259bfcf0d3152f131a73d19b2f107989e15196ede5652c91ae3ab3381e')

package() {
    cd ${srcdir}
    tar -xzf $_srcname-$pkgver.tar.gz
    install -Dm755 "$srcdir/$_srcname" "$pkgdir/usr/bin/$_srcname"
}
