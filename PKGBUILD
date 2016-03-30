# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
pkgver='3.20.1.60'
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
install="${pkgname}.install"
depends=(gtk2 gtk3)
source=("https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(58d2bb69efdcc530891a73db39d3aabbb8d439850d4ffe5cc555d0ff93f1c20d)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
