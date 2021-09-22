# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gtk-theme-bin'
pkgver='5.4.3'
pkgrel=1
_timestamp=1629398560
_commit=6615e45
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
#source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gtk-theme_${pkgver}~${_timestamp}~21.10~${_commit}_all.deb")
source=("https://github.com/pop-os/gtk-theme/releases/download/v${pkgver}/pop-gtk-theme_${pkgver}_all.deb")
sha256sums=('d1cbe385886d4ccfc1709b1656be9f12ca42edcfd8468c1d0d7fa3b858b2559f')

package() {
  cd "${srcdir}"
  
  #tar --zstd -xC "${pkgdir}" -f data.tar.zst
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
