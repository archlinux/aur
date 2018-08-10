# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-icon-theme-bin'
pkgver='1.3.0'
pkgrel=2
pkgdesc='A free and open source SVG icon theme for Linux, based on Paper Icon Set and Papirus.'
arch=('any')
url='https://github.com/system76/pop-icon-theme'
license=('LGPL3')
conflicts=('pop-icon-theme')
provides=('pop-icon-theme')
optdepends=(
  "pop-gtk-theme: Recommended gtk theme"
  "ttf-fira-sans: Recommended font for window titles and interface"
  "ttf-fira-mono: Recommended monospace font"
  "ttf-roboto-slab: Recommended font for documents"
)

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-icon-theme/pop-icon-theme_${pkgver}~1533319529~18.04~1e959c9_all.deb")
sha256sums=('540726cc68cdbe250bb88ec6640ea836cc7cea1e63f9eec050d55552d2f2a706')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
