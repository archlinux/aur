# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=sonobuoy-bin
_srcname=sonobuoy
pkgdesc="Sonobuoy is a diagnostic tool that makes it easier to understand the state of a Kubernetes cluster by running a set of Kubernetes conformance tests in an accessible and non-destructive manner."
pkgver=0.16.0
pkgrel=1
arch=('x86_64')
url="https://github.com/heptio/sonobuoy"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_srcname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f49595f7c6388352ddd89cb6dd41584c1bd5ceddb06fbaee4e3f73a83e0d888d')

package() {
    cd ${srcdir}
    tar -xzf $_srcname-$pkgver.tar.gz
    install -Dm755 "$srcdir/$_srcname" "$pkgdir/usr/bin/$_srcname"
}
