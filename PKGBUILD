# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname='pop-gtk-theme-bin'
pkgver='3.1.1'
pkgrel=3
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
	"gnome-shell>=3.18.3"
	"gnome-flashback>=3.18.2"
	"budgie-desktop>=10.2.7"
	"xfce4-session>=4.12.2"
	"mate-desktop>=1.14.0"
	"lxde-common>=0.99.1"
	"pop-icon-theme-git: Recommended icon theme"
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
)
source=("http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme/pop-gtk-theme_${pkgver}~1525194849~18.04~10930cf_all.deb")
sha256sums=('31a200717c350b795802ab59e8d170dd0f41458d1f4d9b3e5dd39929d9bc9409')

package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
}

# vim: ts=2 sw=2 et:
