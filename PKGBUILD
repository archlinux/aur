# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-icon-theme-bin'
pkgver='2.1.0'
pkgrel=10
pkgdesc='A free and open source SVG icon theme for Linux, based on Paper Icon Set and Papirus.'
arch=('any')
url='https://github.com/pop-os/icon-theme'
license=('LGPL3')
conflicts=('pop-icon-theme')
provides=('pop-icon-theme')
optdepends=(
  "pop-gtk-theme-bin: Recommended gtk theme"
  "ttf-fira-sans: Recommended font for window titles and interface"
  "ttf-fira-mono: Recommended monospace font"
  "ttf-roboto-slab: Recommended font for documents"
)

source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-icon-theme/pop-icon-theme_${pkgver}~1624556204~21.04~5133e82_all.deb")
sha256sums=('19943b46b712dc4917fa790bc79e49dcac7cfd8fc4fbe790c735aca82ec27bd1')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
