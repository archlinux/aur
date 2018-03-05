# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=11.1.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("https://dl.itch.ovh/$pkgname/linux-amd64/v$pkgver/$pkgname.gz")
sha256sums=('e2637b3d838cd3c9ed035f7a702e6f245f25c551a47562737d8a2f74b98b021d')

package() {
  local _dest="${pkgdir}/usr/bin/${pkgname}"
  mkdir -p $(dirname "$_dest")
  gunzip -c "${pkgname}.gz" > "${_dest}"
  chmod 755 "${_dest}"
}
