
# Maintainer: Andre Bauer <novamoona@ts.3v.fi>
pkgname=jeveassets
pkgver=2.10.5
pkgrel=1
epoch=
pkgdesc="Out-of-game asset manager for Eve-Online, written in Java"
arch=('any')
url="http://eve.nikr.net/jeveasset"
license=('GPL2')
groups=()
depends=('jdk7-openjdk' 'unzip')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://eve.nikr.net/jeveassets/jeveassets-2.10.5.zip"
"http://download1324.mediafire.com/79fq1o5sm5ig/7y6467yc30d61y5/jeveassets.sh")
noextract=()
md5sums=('SKIP' 'SKIP')
validpgpkeys=()


package() {

	install -d "$pkgdir/opt/"
	cp -dr --no-preserve=ownership "$srcdir/jEveAssets" "$pkgdir/opt/"

	install -d "$pkgdir/usr/bin/"
	cp -dr --no-preserve=ownership "$srcdir/jeveassets.sh" "$pkgdir/usr/bin"
	
install -Dm755 "$startdir/jeveassets.sh" "$pkgdir/usr/bin/jeveassets.sh"
	
}
