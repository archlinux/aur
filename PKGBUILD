# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=13.1.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("https://dl.itch.ovh/$pkgname/linux-amd64/v$pkgver/$pkgname.gz")
sha256sums=('2efdfe4aae6c9dba072083403e656927c8c0342f4171fa5d69d5e3fcad9aaf9d')

package() {
  local _dest="${pkgdir}/usr/bin/${pkgname}"
  mkdir -p $(dirname "$_dest")
  gunzip -c "${pkgname}.gz" > "${_dest}"
  chmod 755 "${_dest}"
}
