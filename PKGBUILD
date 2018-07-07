#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-kalam
pkgver=2.001
pkgrel=1
pkgdesc="Open-source unicode font for Devanagari."
url="http://github.com/itfoundry/laila"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/itfoundry/kalam/master/build/Kalam"
source=("$pre_url-Regular.otf"
	"$pre_url-Light.otf"
	"$pre_url-Bold.otf")
md5sums=('c2f304836f720849726b1322780a8585'
         '5dfc0b5e8ba6787711ad8fdbd2561aeb'
         'bb3aa5bc4a17ea6001b655b268888712')

package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}

