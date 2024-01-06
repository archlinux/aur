pkgname=kdash-bin
_pkgname=${pkgname%-bin}
pkgver=0.4.5
pkgrel=1
pkgdesc="A simple and fast dashboard for Kubernetes"
arch=('x86_64')
url="https://github.com/${_pkgname}-rs/${_pkgname}"
license=('MIT')
depends=(
  'pacman>5'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-rs/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=('9d7d67f60ec3c1c139e4f31a38a4662ddaf7c390c605e97da5f3966a86985503')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
