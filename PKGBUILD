# Maintainer: rafauke <m6vuthzbw at mozmail dot com>

_themename=chain

pkgname=plymouth-theme-${_themename}
pkgver=1.0.0
pkgrel=1
pkgdesc='A custom theme for Plymouth inspired by the blockchain theme in plymouth themes.'
arch=('any')
url='https://github.com/Hugopikachu/plymouth-theme-chain'
license=('MIT')
depends=('plymouth')
source=(
  "${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('4b734dcebd4bf19c6a01aa273822aab138f40c0d5019a15bfe92d4cbf0c3eb22')
install="${pkgname}.install"

package() {
  mkdir -p "${pkgdir}/usr/share/plymouth/themes/${_themename}"
  cp -R "${srcdir}/${pkgname}-${pkgver}/." ${pkgdir}/usr/share/plymouth/themes/${_themename}
}
