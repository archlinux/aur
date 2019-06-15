# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=butler
pkgver=15.12.0
pkgrel=1
pkgdesc='Command-line itch.io helper'
arch=('x86_64')
url='https://github.com/itchio/butler'
license=('MIT')
source=("https://dl.itch.ovh/$pkgname/linux-amd64/v$pkgver/$pkgname.gz")
sha256sums=('0067ce461be64282b3920093b3ff77c439777681932b4d030af21e26ca0a88e5')

package() {
  local _dest="${pkgdir}/usr/bin/${pkgname}"
  mkdir -p $(dirname "$_dest")
  gunzip -c "${pkgname}.gz" > "${_dest}"
  chmod 755 "${_dest}"
}
