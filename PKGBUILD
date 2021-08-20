# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gnome-shell-theme-bin'
pkgver='5.4.3'
pkgrel=1
_timestamp=1629313952
_commit=489dbc8
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
source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gnome-shell-theme_${pkgver}~${_timestamp}~21.10~${_commit}_all.deb")
sha256sums=('5140527989298574d17131b4ff984c13a24bf14101cfae2688f8bb80a75b75c5')

package() {
  cd "${srcdir}"
  
  tar --zstd -xC "${pkgdir}" -f data.tar.zst
}

# vim: ts=2 sw=2 et:
