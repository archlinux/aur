pkgname=kdash-bin
_pkgname=${pkgname%-bin}
pkgver=0.6.2
pkgrel=1
pkgdesc="A simple and fast dashboard for Kubernetes"
arch=('x86_64')
url="https://github.com/${_pkgname}-rs/${_pkgname}"
license=('MIT')
depends=(
  'pacman>5'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-rs/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=('9e9ff48611e77782fd1e9503c69257d28b827503212a3f09a3dfdeb28ec23b5b')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
