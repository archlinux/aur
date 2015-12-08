# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname='mozart2'
pkgver='2.0.0_alpha.0.4140'
pkgrel=1
pkgdesc='An open source implementation of Oz 3.'
arch=('x86_64' 'i386')
url='https://github.com/mozart/mozart2'
license=('BSD')
depends=('tcl>=8.5' 'tcl<8.6' 'tk>=8.5' 'tk<8.6' 'emacs')
source=(bin.rpm::https://sourceforge.net/projects/mozart-oz/files/v2.0.0-alpha.0/mozart2-2.0.0-alpha.0%2Bbuild.4140.005f700-x86_64-fc22.rpm/download
	https://raw.githubusercontent.com/mozart/mozart2/master/LICENSE.txt
	)
sha512sums=('dbdf8619d41918e7403a8ea3a7759fdc15013c9bece37ce10d16371428f15c66a31be3624175a4d49ce318647200eac56806922ba240935e421e061e32d8690c'
            'c21dfa28faa03a703d853416126d2135330919036b33b40c790569bccb9a0fdbb3cd3acde0cd001a84333f7fe25a18d02be970612720d7726b01a26f0317a78b')
package() {
	cd "$srcdir"
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	cp -R usr "$pkgdir"
}
