# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-sound-theme-bin'
pkgver='5.3.1'
pkgrel=1
_timestamp=1605227705
_commit=50f789b
pkgdesc='System76 Pop Sound Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-sound-theme')
provides=('pop-sound-theme')

source=("https://github.com/pop-os/gtk-theme/releases/download/v${pkgver}/pop-sound-theme_${pkgver}_all.deb")
sha256sums=('a4c5d92a41e27813ca3fedba5eb40c41d7f48be9bd4832a69cbae5742ee00f11')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
