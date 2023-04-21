# Maintainer: bgh <aur at bgh dot io>

pkgname=it-tools-web
_pkgname=it-tools
pkgver=2023.4.14_dbad773
pkgrel=1
pkgdesc='Collection of handy online tools for developers, with great UX'
arch=('any')
url=https://github.com/CorentinTh/it-tools
license=('GPL3')
source=("${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.zip")
sha256sums=('ba3ee59724b3f7f449f2d9c733905184eea6d61d91c9077de050a8c8d4a9c5e3')

package() {
    local dest_dir="/usr/share/webapps/${_pkgname}"

    install --directory --verbose "${pkgdir}${dest_dir}"
    cp --recursive --no-target-directory dist "${pkgdir}${dest_dir}"
}
