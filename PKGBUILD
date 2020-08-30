# Maintainer: Ilya Elenskiy 

pkgname=hapview
pkgver=20200830
pkgrel=1
pkgdesc="Haplotype Viewer"
arch=('any')
url="http://www.cibiv.at/~greg/haploviewer"
license=('GPL3')
depends=('java-runtime' 'sh')
source=('http://www.cibiv.at/~greg/HapView.zip'
	'hapview'
	'hapview.desktop')
md5sums=('17b3cf6913c426202314d508446a9d51'
         '5534e7605583ef7fcf13c8b720e37dfc'
         '89b680a23922429a2e31f75c4e1427b3')

pkgver() {
  	date +%Y%m%d
}

package() {
	pwd
	install -Dm644 "$srcdir/HapView/lib/hapView.jar" "$pkgdir/usr/share/java/hapview/hapView.jar"
	install -Dm755 "$srcdir/hapview" "$pkgdir/usr/bin/hapview"
	install -Dm644 "$srcdir/hapview.desktop" "$pkgdir/usr/share/applications/hapview.desktop"
}
