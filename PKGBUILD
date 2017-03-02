# Maintainer: Marcus Behrendt <marcus (dot) behrendt (dot) eightysix (in digits) (at) bigbrothergoogle (dot) com

pkgname=plasma5-applets-keystate
pkgver=0.5
pkgrel=1
pkgdesc="An accessibility Plasmoid that shows the status of various key on your keyboard (for example if Caps Lock is enabled or Meta is pressed). "
arch=('i686' 'x86_64')
url="https://store.kde.org/p/998903"
license=('GPL')
depends=('plasma-workspace')
makedepends=('unzip')
provides=("${pkgname-*}")
source=("https://dl.opendesktop.org/api/files/download/id/1473016000/eu.blumenstingl.martin.keystateplasmoid.plasmoid")
md5sums=('11a51e6528c5cdb3453c9a3395a4ba82')

_applet_name="eu.blumenstingl.martin.keystateplasmoid.plasmoid"

noextract=("${_applet_name}")

package() {
    cd "${gitpkgname}"

    _install_dir="${pkgdir}/usr/share/plasma/plasmoids/${_applet_name}"

    mkdir -p "${_install_dir}"
    unzip "${_applet_name}" -d "${_install_dir}"
}
 
