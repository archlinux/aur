# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gnome-shell-theme-bin'
pkgver='2.99.4'
_pkgdir="3.0.0-b4"
pkgrel=1
pkgdesc='Pop GNOME Shell Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gnome-shell-theme')
provides=('pop-gnome-shell-theme')
source=("https://github.com/pop-os/gtk-theme/releases/download/${_pkgdir}/pop-gnome-shell-theme_${pkgver}_all.deb")
sha256sums=('599fe37c78900f93fd91ab2001a2b6c7f1ba59f2319cc5ab1902072cba924d97')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
