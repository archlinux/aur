# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2026.1.4
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/sharevb/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
b2sums=('d8aa82097c4fcc8e6da4dd3ccd5a50f54ae23e0295cfac08d77acfd9f8abd1f37a2354438106a415a46df372e63ca49cbe2d6947fbb8bd83c2f44459ffe4a5ae')

package() {
  local _dest_dir="/usr/share/webapps/${_pkgname}"

  install --directory "${pkgdir}${_dest_dir}"
  cp --recursive dist/* "${pkgdir}${_dest_dir}"
}
