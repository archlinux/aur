# Maintainer: bgh <aur at bgh dot io>

_pkgname=it-tools
pkgname="${_pkgname}-web"
pkgver=2023.8.21_6f93cba
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url="https://github.com/CorentinTh/${_pkgname}"
license=('GPL3')
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.zip")
b2sums=('911f66fba7a8a03c083a439c10a8edb50fd91043b8ab448714498bdc1bab64dd43f3a4f076189921590e5bdf6e3674f683805bf9f083158e772b28b093440d95')

package() {
    local _dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory "${pkgdir}${_dest_dir}"
    cp --recursive --no-target-directory dist "${pkgdir}${_dest_dir}"
}
