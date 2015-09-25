# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname='mozart2'
pkgver='2.0.0'
pkgrel=1
pkgdesc='An open source implementation of Oz 3.'
arch=('x86_64' 'i386')
url='https://github.com/mozart/mozart2'
license=('BSD')
depends=('tcl>=8.5' 'tcl<8.6' 'tk>=8.5' 'tk<8.6' 'emacs')
source=(bin.tar.gz::http://sourceforge.net/projects/mozart-oz/files/v2.0.0-alpha.0/mozart2-2.0.0-alpha.0%2Bbuild.4105.5c06ced-$CARCH-linux.tar.gz/download
	https://raw.githubusercontent.com/mozart/mozart2/master/LICENSE.txt
	)
sha512sums=('6dbbca31c02ae2cb35ed4381ee575ecf2281be710d4bdaaf45df984b965780eb2d9cd5ab10efe7126b1aabeb057010278c4e042051f0c73467c069cfac20f7f5'
            'c21dfa28faa03a703d853416126d2135330919036b33b40c790569bccb9a0fdbb3cd3acde0cd001a84333f7fe25a18d02be970612720d7726b01a26f0317a78b')
package() {
	cd "${srcdir}"
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	cp -R mozart2-2.0.0-alpha.0+build.4105.5c06ced-$CARCH-linux/* "$pkgdir/usr"
}
