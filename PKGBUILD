# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10-dark
pkgver=3.2
_pkgver=3.0
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines"
arch=('any')
url="https://github.com/B00merang-Project/Windows-10-Dark"
license=('GPL')
optdepends=('gtk-engine-murrine: for the GTK2 theme'
            'gnome-themes-extra: for the GTK3 theme?')
changelog=${pkgname}.changelog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/B00merang-Project/Windows-10-Dark/archive/3.0-dark.tar.gz")
sha1sums=('d92fcedd23d233c2e05c40e82873275965385f4c')


package() {
	cd Windows-10-Dark-${_pkgver}-dark

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10Dark"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10Dark/{}" \;
}

