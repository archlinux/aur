# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2025.8.6_0325b117
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/sharevb/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.zip")
b2sums=('c863cbd6c6467d329ffdbf27d6668ed126bb72c187252e6bdd52cd82ccca98fed49cada013e31e722045f44024bd3454f24b292bd048d9e988bc12c729509d47')

package() {
  local _dest_dir="/usr/share/webapps/${_pkgname}"

  install --directory "${pkgdir}${_dest_dir}"
  cp --recursive dist/* "${pkgdir}${_dest_dir}"
}
