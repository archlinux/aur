# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10
pkgver=3.1
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/B00merang-Project/Windows-10"
license=('GPL')
optdepends=('gnome-themes-extra: for the GTK3 theme?'
            'gtk-engine-murrine: for the GTK2 theme'
            'windows10-tint2rc: theme for tint2')
changelog=${pkgname}.changelog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/B00merang-Project/Windows-10/archive/${pkgver}.tar.gz")
sha1sums=('8001807aa6e36f5408854c30d61d3b8dfc39aa9c')


package() {
  	cd Windows-10-$pkgver

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;
}
