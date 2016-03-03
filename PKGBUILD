# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-gtk-theme
pkgver='3.18.8+git20160303'
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines."
arch=(any)
url="https://github.com/tista500/Adapta"
license=('GPL2')
depends=(gtk2 gtk3)
source=("https://github.com/tista500/Adapta/archive/${pkgver}.tar.gz")
md5sums=(2cfc40ddc42b71de986eb288bf83b7b7)
sha1sums=(9a1bef954ed3db430a7b1783408aa04df562660a)
sha256sums=(fceedd4603cb07ddd7517fc0830846dad47370ea91c9f6476ba2c4dfbe9cf67d)

_theme_name=Adapta
_extracted_folder="${_theme_name}-$(sed s/+/-/g <<< "$pkgver")"

package() {
    target="${pkgdir}/usr/share/themes/${_theme_name}"
    install -dm755 "$target"
    cp -dpr --no-preserve=ownership "${_extracted_folder}/." -d "$target"
}
