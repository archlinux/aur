# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-dark
pkgver=0.9.6
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard')
changelog=${pkgname}.changelog
source=("https://github.com/Elbullazul/Windows-10/releases/download/v0.9.6/Windows.10.Dark.v0.9.6.zip")
sha1sums=('34e22dcc639b92959f4592f7ac0bce023388c903')

package() {
	cd Windows\ 10\ Dark

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10Dark"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10Dark/{}" \;
}

