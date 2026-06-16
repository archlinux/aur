pkgname=kdash-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple and fast dashboard for Kubernetes"
arch=('x86_64')
url="https://github.com/${_pkgname}-rs/${_pkgname}"
license=('MIT')
depends=(
  'pacman>5'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}-rs/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.tar.gz")
sha256sums=('b393a6c92188deeb50c1a68b83a11060fed3c0f510c530ebc3397c1bec4ae800')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
