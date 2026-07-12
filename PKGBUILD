pkgname=kdash-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple and fast dashboard for Kubernetes"
arch=('x86_64')
url="https://github.com/${_pkgname}-rs/${_pkgname}"
license=('MIT')
depends=(
  'pacman>5'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-rs/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=('22438a9e3d73443ad676cba9c49ec8e2118dfb4b636a82826def7051b4830b22')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
