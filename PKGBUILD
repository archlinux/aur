# Maintainer: wsw0108 <wsw0108@gmail.com>
pkgname=deepin-wine-apps-kde-fix
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Run gnome-settings-daemon under KDE to fix problem of some apps depends on deepin-wine"
arch=('i686' 'x86_64')
url="https://aur.archlinux.org/deepin-wine-apps-kde-fix"
license=('GPL')
groups=()
depends=('gnome-settings-daemon')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('gsd-xsettings-deepin-wine-kde.desktop')
noextract=()
md5sums=('58d2a2d8908b1e9e40f50cf407d9b1ad')
validpgpkeys=()

package() {
    mkdir -p "${pkgdir}/etc/xdg/autostart/"
    install -m644 "${srcdir}/gsd-xsettings-deepin-wine-kde.desktop" "${pkgdir}/etc/xdg/autostart/"
}
