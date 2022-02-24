# Maintainer: Tea <icepie.dev@gmail.com>
pkgname=gnome-randr
pkgver=0.0.1
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('GPL')
groups=()
depends=(
    'gnome-desktop'
)
makedepends=()
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
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "${srcdir}/${pkgname}/${pkgname}.py"
    cp "${srcdir}/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
