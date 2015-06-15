# Maintainer: Tristan Stenner <ttstenner@gmail.com>
pkgname=pandoc-rstudio
pkgver=1.13.1
pkgrel=1
pkgdesc='rstudio includes pandoc, this package creates the links in /usr/bin'
arch=('i686' 'x86_64')
url='http://www.rstudio.org/'
license=('GPL')
depends=('rstudio-desktop-bin')
provides=('haskell-pandoc')
conflicts=('haskell-pandoc')
source=()

build() {
	echo "Nothing to be done"
}

package() {
	cd $pkgdir
	mkdir -p usr/bin
	cd usr/bin
	ln -s /usr/lib/rstudio/bin/pandoc/pandoc
	ln -s /usr/lib/rstudio/bin/pandoc/pandoc-citeproc
}
