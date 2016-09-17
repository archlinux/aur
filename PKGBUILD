# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10
pkgver=0.9.9_AU
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard' 'windows10-tint2rc')
changelog=${pkgname}.changelog
source=("https://github.com/Elbullazul/Windows-10/releases/download/v${pkgver//_/-}/Windows.10.Light.v0.9.9.SP1.tar.gz")
sha1sums=('e61b5b40f67e2ea870c7d51be7a68664d3cf1c54')

package() {
  	cd Windows\ 10\ Light

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;
}
