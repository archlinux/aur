# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2026.9.27
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/sharevb/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
b2sums=('be03075572db16510d7ee81232c408fc88ad4f3652cec747a7b5cf5a1ece62d4d560ded2ce39e1112b9c1f403b1d882b3ca2022d794b217bb8143bcc52c54b11')

package() {
  local _dest_dir="/usr/share/webapps/${_pkgname}"

  install --directory "${pkgdir}${_dest_dir}"
  cp --recursive dist/* "${pkgdir}${_dest_dir}"
}
