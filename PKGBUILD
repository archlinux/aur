# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
pkgname=microsoft365-chromium
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="A launcher for Microsoft 365"
arch=('any')
url='office.com'
license=('MIT')
groups=()
depends=('chromium')
makedepends=()
checkdepends=()
optdepends=(
	'xdg-desktop-portal-kde: KDE native file chooser'
	'xdg-desktop-portal-lxqt: lxqt native file chooser'
	'xdg-desktop-portal-gnome: Gnome native file chooser'
)
provides=()
conflicts=()
replaces=()
install=${pkgname}.install
source=(
	microsoft365-chromium.desktop
)
noextract=()
md5sums=(
	'SKIP'
)
validpgpkeys=()
package() {
    mkdir -p ${pkgdir}/usr/share/applications
    cp ${srcdir}/microsoft365-chromium.desktop ${pkgdir}/usr/share/applications
    chmod 644 -R ${pkgdir}/usr/share/applications
}

function info() {
	all_off="$(tput sgr0)"
	bold="${all_off}$(tput bold)"
	blue="${bold}$(tput setaf 4)"
	yellow="${bold}$(tput setaf 3)"
    printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
}
