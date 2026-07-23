pkgname=kdash-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.1
pkgrel=1
pkgdesc="A simple and fast dashboard for Kubernetes"
arch=('x86_64')
url="https://github.com/${_pkgname}-rs/${_pkgname}"
license=('MIT')
depends=(
  'pacman>5'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-rs/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=('97507163287b0de2e246624a4f6dba2fc79290d2b003c9c711d2c73343a2f3d6')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
