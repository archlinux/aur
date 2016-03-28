# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
pkgver='3.18.9.55'
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
depends=(gtk2 gtk3)
source=("https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
sha256sums=(ce84914474af8f6276f120717b068a2629c0bf4fedd8f27ed6c03d562d4a7393)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$pkgver"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
