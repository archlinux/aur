# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
pkgver='3.18.9.18'
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
depends=(gtk2 gtk3)
source=("https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(b81f3cf9d1423252473db57e011bb3ac972a930b9bd5df501f85fe98a02798e8)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
