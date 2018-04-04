# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gnome-shell-theme-bin'
pkgver='3.1.1'
pkgrel=1
pkgdesc='System76 Pop GNOME Shell Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gnome-shell-theme')
provides=('pop-gnome-shell-theme')
source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gnome-shell-theme_${pkgver}~1522854917~18.04~c419e03_all.deb")
sha256sums=('e0b613e88aa1cca5bf9bf3dc9edf97081ae67e832cce5c3640c88bd1e0eff65c')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
