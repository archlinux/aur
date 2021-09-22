# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gnome-shell-theme-bin'
pkgver='5.4.3'
pkgrel=1
_timestamp=1629398560
_commit=6615e45
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
#source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gnome-shell-theme_${pkgver}~${_timestamp}~21.10~${_commit}_all.deb")
source=("https://github.com/pop-os/gtk-theme/releases/download/v${pkgver}/pop-gnome-shell-theme_${pkgver}_all.deb")
sha256sums=('71251e01add063368eb29d3fd5bae1fd0a3f6cff0a352366d44d426604d5fecc')

package() {
  cd "${srcdir}"
  
  #tar --zstd -xC "${pkgdir}" -f data.tar.zst
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
