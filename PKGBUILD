# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2025.8.31_13b8f041
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/sharevb/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.zip")
b2sums=('a01e6e189fb608f22a3fbc1d4b00c439eb93b6520de5baf909d855ccfe70d83420ebd6c761740e99bad968ebc093c193dd063264938c6048377f1a5dee94b9a6')

package() {
  local _dest_dir="/usr/share/webapps/${_pkgname}"

  install --directory "${pkgdir}${_dest_dir}"
  cp --recursive dist/* "${pkgdir}${_dest_dir}"
}
