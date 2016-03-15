# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
pkgver='3.18.8.238'
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
depends=(gtk2 gtk3)
source=("https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(9826432ef9824e75666b4aa9896115df572691e6f58d6552a536e02b6eb5fbe5)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
