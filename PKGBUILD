# Maintainer: Tea <icepie.dev@gmail.com>
pkgname=gnome-randr
pkgver=0.0.1
pkgrel=4
pkgdesc="This tries to reimplement the some of the functionality of 'xrandr' for the gnome desktop using mutter's dbus-api.
It currently has not been tested with fractional scaling support."
arch=('any')
url="https://gitlab.com/Oschowa/gnome-randr"
license=('GPL')
groups=()
depends=(
    'mutter'
)
makedepends=(
    'git'
)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://gitlab.com/Oschowa/gnome-randr")
noextract=()
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
