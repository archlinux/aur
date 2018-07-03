# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='mongodb-compass-readonly-beta'
pkgver='1.15.0beta.6'
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Readonly Edition (beta version)'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom')
depends=('nss' 'gconf' 'libxtst' 'alsa-lib' 'gtk2' 'libsecret' 'gcc-libs-multilib' 'libxss')
optdepends=('gnome-keyring' 'libgnome-keyring')
source=('https://downloads.mongodb.com/compass/beta/mongodb-compass-readonly-beta-1.15.0-beta.6.x86_64.rpm')
md5sums=('94ae95b47f809d03d734b54d6b9be7c6')

package() {
	rm -r "$srcdir/usr/share/doc/"
	mkdir -p "$srcdir/usr/share/licenses/mongodb-compass-readonly-beta"
	mv "$srcdir/usr/share/mongodb-compass-readonly-beta/LICENSE"* "$srcdir/usr/share/licenses/mongodb-compass-readonly-beta"

	cp -r --preserve=mode "$srcdir/usr/" "$pkgdir/usr/"
}
