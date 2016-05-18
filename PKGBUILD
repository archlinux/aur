# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-git
pkgver=0.9.7.beta
_pkgver=0.9.7-beta
_pkgname=Windows.10.Light
pkgrel=2
pkgdesc="Testing build of GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard' 'windows10-tint2rc')
source=("https://github.com/Elbullazul/Windows-10/releases/download/v${_pkgver}/${_pkgname}.v${_pkgver}.zip")
sha1sums=('3502ea40722a4166112a6b6249c6cc5db48b58e0')

package() {
  	cd Windows\ 10\ Light

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10_Beta"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10_Beta/{}" \;
}