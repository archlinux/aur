# Maintainer: Harley Amundsen dragos240alt@gmail.com
pkgname=skyperious
pkgver=3.5
pkgrel=1
pkgdesc="Skype SQLite database viewer and merger"
arch=('any')
url="https://suurjaak.github.io/Skyperious/"
license=('MIT')
makedepends=('python2-setuptools'
			 'unzip'
			)
depends=('wxpython2.8'
		 'python2-beautifulsoup4'
		 'python2-pillow'
		 'python2-pyparsing'
		 'python2-dateutil'
		 'skype4py'
		 'python2-xlsxwriter'
)
source=("http://erki.lap.ee/downloads/Skyperious/${pkgname}_${pkgver}-src.zip")
noextract=("${pkgname}_${pkgver}-src.zip")

prepare(){
	cd $srcdir
	unzip ../${pkgname}_${pkgver}-src.zip
}

package() {
	cd "${pkgname}_${pkgver}"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('bbcf59a629ed6ab951efa10414cd9441')
sha1sums=('e0bcda075b13746df5310b514ffc75cfb63d4ab1')
sha256sums=('8c357f825f40e3ff4c73fe93858ef4a96ac8cdfc09f402c8a4649cce8196fa9d')
