# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gnome-shell-theme-bin'
pkgver='5.2.0'
pkgrel=4
_timestamp=1588000066
_commit=f13d51a
pkgdesc='System76 Pop GNOME Shell Theme'
arch=('any')
url='https://github.com/pop-os/gnome-shell-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gnome-shell-theme')
provides=('pop-gnome-shell-theme')
depends=(
  "gnome-shell>=3.18.3"
  "pop-gtk-theme-bin"
)
optdepends=(
  "pop-icon-theme-bin: Recommended icon theme"
  "pop-sound-theme-bin: Recommended sound theme"
  "ttf-fira-sans: Recommended font for window titles and interface"
  "ttf-fira-mono: Recommended monospace font"
  "ttf-roboto-slab: Recommended font for documents"
  "pop-session-bin"
)
source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gnome-shell-theme_${pkgver}~${_timestamp}~20.04~${_commit}_all.deb")
sha256sums=('4362b205be1a4fb630014d21c3c82fa0f735d115fdc3dbe9cbe62384fc602f1b')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
