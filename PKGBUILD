# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-icon-theme-bin'
pkgver='2.0.0'
pkgrel=1
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

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-icon-theme/pop-icon-theme_${pkgver}~1554410808~19.04~f1db53f_all.deb")
sha256sums=('882f166e9d3b90a80029bb3c8f71fc6b6bcc81738ddb6f7aa52e63dc2d73f8b4')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
