# Maintainer: luxemboye <luxemboye protonmail com>

pkgname=stardict-acadfr1935
# Package version is taken from .ifo date
pkgver=20080601
pkgrel=1
pkgdesc="8th edition of the Académie Française dictionary (1935) for StarDict"
arch=('any')
url="https://polyglotte.tuxfamily.org/doku.php?id=donnees:dicos_bilingues"
license=('custom:public domain')
optdepends=('stardict: view the dictionary')
source=(https://download.tuxfamily.org/polyglotte/dicos/dict/francais%2Fstardict-academie-francaise-1935_38.xdxf-2.4.2.zip)
sha256sums=('6196587e54a19f8a2145584d020278326eb73cb6f3e8728f7dbbc365a76c5994')

package() {
	mkdir -p "$pkgdir/usr/share/stardict/dic/acadfr1935"
	cd $srcdir/stardict-Academie-Francaise-1935_38.xdxf-2.4.2
	install -m 644 *.dict.dz *.idx *.ifo "$pkgdir/usr/share/stardict/dic/acadfr1935/"
}
