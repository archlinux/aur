# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
pkgname=sortpictures-git
projectname=sortpicture
scriptname=sortpictures.sh
pkgver=0.1
pkgrel=1
pkgdesc='Sort and organized pictures in subfolders by date'
arch=('any')
url='https://gitlab.com/eathtespagheti/sortpicture'
license=('GPL3')
depends=('bash' 'imagemagick')
source=("https://gitlab.com/eathtespagheti/$projectname/raw/v$pkgver/$scriptname")
md5sums=('de4b143e3e9fd15e20bb732825260714')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install $scriptname $pkgdir/usr/bin/$projectname
}
