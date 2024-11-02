# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2024.10.22_7ca5933
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/CorentinTh/${_pkgname}"
license=('GPL-3.0-only')
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.zip")
b2sums=('558897a1ea265a71de67c77501f575042fb0edacac0f5dc134f63483a9a33987ea83957d559b357d59090190142b9ce42419d356d63424001098c953a17c9d43')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    cp --recursive --no-target-directory dist "${pkgdir}${_dest_dir}"
}
