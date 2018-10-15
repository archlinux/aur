# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gtk-theme-bin'
pkgver='4.0.0'
pkgrel=2
_timestamp=1539632457
_commit=37a6b46
pkgdesc='System76 Pop GTK+ Theme'
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('GPL2' 'CCPL:by-sa')
conflicts=('pop-gtk-theme')
provides=('pop-gtk-theme')
depends=(
	"gtk3>=3.18.9"
	"gtk2>=2.24.30"
	"gdk-pixbuf2>=2.24.30"
	"gtk-engine-murrine>=0.98.1"
)
optdepends=(
	"gnome-shell"
	"gnome-flashback"
	"budgie-desktop"
	"xfce4-session"
	"mate-desktop"
	"lxde-common"
	"pop-icon-theme: Recommended icon theme"
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
)
source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gtk-theme_${pkgver}~${_timestamp}~18.10~${_commit}_all.deb")
sha256sums=('64086c7683c382790ff57b3ceb7eac3fca352b55e9faf6b0a0a8c0b4b976a490')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
