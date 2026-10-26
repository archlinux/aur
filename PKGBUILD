# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2026.10.25
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/sharevb/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.zip")
b2sums=('a696696de0dc03f0533f8bca111bf37e045a64f8bde35c472b1dfa0640cad2634970374222e824b4e9f2978e4423cedc3c489b7e7cd94aca8667978fe9fff548')

package() {
  local _dest_dir="/usr/share/webapps/${_pkgname}"

  install --directory "${pkgdir}${_dest_dir}"
  cp --recursive dist/* "${pkgdir}${_dest_dir}"
}
