# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2024.5.13_a0bc346
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/CorentinTh/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.zip")
b2sums=('ad5df71fac5e1e9cf2c6d7a47d4a1feab8087068ffdc5f7f27342a494f9079b40ef128954401f5b27f1d2a86d9b3599ac0bc2a5728c33f9e8a915d36b3d372fe')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    cp --recursive --no-target-directory dist "${pkgdir}${_dest_dir}"
}
