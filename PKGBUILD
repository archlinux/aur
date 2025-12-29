# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2025.12.7
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/sharevb/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
b2sums=('4d71571edc63eebb533e38abccd2d6bbe15e8cc5b749cca613fb745998e1e3a63d1eaadc600f17d70ae941eef2d9daac405038d4565dc090f8cb78dc0be396a6')

package() {
  local _dest_dir="/usr/share/webapps/${_pkgname}"

  install --directory "${pkgdir}${_dest_dir}"
  cp --recursive dist/* "${pkgdir}${_dest_dir}"
}
