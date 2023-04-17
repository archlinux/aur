# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=termv-rs
pkgver=0.1
pkgrel=1
pkgdesc="Termv. Now blazingly fast"
arch=("x86_64")
url="https://github.com/Roshan-R/termv-rs"
license=('GPL')
depends=('glibc' 'gcc-libs')
optdepends=()
makedepends=()
conflicts=("${pkgname%-rs}")

source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname}")
sha256sums=('821bf1a8711895f8b93287bde117a6e686d9f79468dd4a1ae2fe69ca3d04ea6f')

package () {
  install -Dm775 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}