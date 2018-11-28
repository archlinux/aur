# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-icon-theme-bin'
pkgver='1.3.0'
pkgrel=3
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

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-icon-theme/pop-icon-theme_${pkgver}~1543200973~18.10~e375407_all.deb")
sha256sums=('8861943aeff4438fdaf8123fc6e516ccf1617e5b3bed9d51b7ef8699f722fc11')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
