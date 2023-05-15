# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2023.5.14_77f2efc
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/CorentinTh/${_pkgname}"
license=('GPL3')
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.zip")
sha256sums=('a9803230cef2b03af98ffc7fdadcaecf66bb276d4ce858450e65de39016193f9')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    cp --recursive --no-target-directory dist "${pkgdir}${_dest_dir}"
}
