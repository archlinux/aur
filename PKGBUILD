# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-isolated-beta'
pkgver='1.18.0beta.2'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-isolated-beta-1.18.0-beta.2.x86_64.rpm')
md5sums=('c3526555dc2eaf527a589a01be8ee4c0')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-isolated-beta"
	mv "$srcdir/usr/share/mongodb-compass-isolated-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-isolated-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
