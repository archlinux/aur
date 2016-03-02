# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
pkgver='3.18.8+git20160301'
pkgrel=1
pkgdesc="Button An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
depends=(gtk2 gtk3)
source=("https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
md5sums=(2b52c4155fb821334aea1ed24b6e1813)
sha1sums=(ac4894e15d10b29c58b7f5cbe7c2eeb9c8182403)
sha256sums=(ac4bebb51cfee5fee1273024d957d546b09d1ef2c78ae2ad27a7f140b4e0407c)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$(sed s/+/-/g <<< "$pkgver")"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
