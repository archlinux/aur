# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-git
pkgver=0.9.7.Alpha
_pkgver=v0.9.7-Alpha
_pkgname=Windows.10.Light
pkgrel=1
pkgdesc="Testing build of GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard' 'windows10-tint2rc')
source=("https://github.com/Elbullazul/Windows-10/releases/download/${_pkgver}/${_pkgname}.v${pkgver}.tar.gz")
sha1sums=('5674bc6321fef7c4dea3fea9551d4026c27933cf')

package() {
  	cd Windows\ 10\ Light

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10_Alpha"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10_Alpha/{}" \;
}