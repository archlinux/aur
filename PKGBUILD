# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2025.10.12
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/sharevb/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
b2sums=('2cad411476ea4ee730bb4513877b4e2031708d956700d4aa6cb3e48a463d61ad2ed180b985d7f10c32cb5e73f3174dd1ba1b9a6e6ca65122325f901d5e459f7c')

package() {
  local _dest_dir="/usr/share/webapps/${_pkgname}"

  install --directory "${pkgdir}${_dest_dir}"
  cp --recursive dist/* "${pkgdir}${_dest_dir}"
}
