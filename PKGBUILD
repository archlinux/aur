# Maintainer: benpiano800 <benpiano800@protonmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10
pkgver=3.2.1
pkgrel=2
pkgdesc="GTK 3.x Theme that looks like the Windows 10 default theme."
arch=('any')
url="https://github.com/B00merang-Project/Windows-10"
license=('GPL')
optdepends=('gnome-themes-extra: for the GTK3 theme?'
            'gtk-engine-murrine: for the GTK2 theme'
            'windows10-tint2rc: theme for tint2')
changelog=${pkgname}.changelog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/B00merang-Project/Windows-10/archive/${pkgver}.tar.gz")
sha1sums=('3ab1dd1ecc386e57f42a3ce5f0b9f30a6490e0a3')


package() {
  	cd Windows-10-$pkgver

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;
}
