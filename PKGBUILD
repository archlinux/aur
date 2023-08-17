# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2023.8.16_9bd4ad4
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/CorentinTh/${_pkgname}"
license=('GPL3')
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.zip")
b2sums=('bc55de1d5a14dfa1305065bb61dbf6eb99ec12294bd3c9931410d6e91b45fe43702f3706d5e1fcebcb0bf95a9439630c1d8799a00ff34f74416b64d57fd4099b')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    cp --recursive --no-target-directory dist "${pkgdir}${_dest_dir}"
}
