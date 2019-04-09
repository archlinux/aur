# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.9.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("https://dl.itch.ovh/$pkgname/linux-amd64/v$pkgver/$pkgname.gz")
sha256sums=('3479a905a7e3f358253d2b965176bcf1667b9fc6eae7b940f4714a44ed1992f9')

package() {
  local _dest="${pkgdir}/usr/bin/${pkgname}"
  mkdir -p $(dirname "$_dest")
  gunzip -c "${pkgname}.gz" > "${_dest}"
  chmod 755 "${_dest}"
}
