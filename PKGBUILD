# Maintainer: Gabriel M. Dutra <gabrieldutra@tutanota.com>

_name=ktop
pkgname=ktop-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A top-like tool for your Kubernetes cluster metrics"
arch=('x86_64')
url="https://github.com/vladimirvivien/ktop"
license=("Apache-20")
source=("https://github.com/vladimirvivien/${_name}/releases/download/v${pkgver}/${_name}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('f8104e5d09bb764da014ba87e5f75c73f55a26b907e9699f43176848a33dbea6')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}

