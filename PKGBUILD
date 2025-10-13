# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=ttf-genei-koburi
pkgver=20251013
pkgrel=1
pkgdesc='A free Japanese kanji font'
arch=('any')
url='https://fontmeme.com/fonts/genei-koburi-mincho-font/'
license=('OFL-1.1')
source=("https://www.freefontdownload.org/download-font/genei-koburi-mincho")
sha512sums=('135ac2faea910fde01bf32733e9b21a022229caee5910acb6633434a768fd2e96ce165ea17a0857ab8cf4e0b86abe2b623d273d22d4df1c3ae996ea466d24e93')

package() {
	cd "$srcdir"
	install -Dm644 genei-koburi-mincho.ttf "$pkgdir/usr/share/fonts/TTF/genei-koburi-mincho.ttf"
}
