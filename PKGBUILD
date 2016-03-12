# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
pkgver='3.18.8.229'
pkgrel=2
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
depends=(gtk2 gtk3)
source=("https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(a3f518f2cfeeaa10e00d24cd33508a9e0bb0ed48476e83949f1db2caf356e2d4)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
