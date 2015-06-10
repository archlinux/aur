# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Chad Davis <archlinux@davtek.com>

pkgname=otf-fifthleg
pkgver=0.6
pkgrel=5
pkgdesc='Font used for openSUSE-branded material'
arch=('i686' 'x86_64')
license=('custom:OFL')
url='http://jimmac.musichall.cz/log/?p=440'
depends=('fontconfig' 'xorg-font-utils')
source=("https://api.opensuse.org/public/source/openSUSE:Factory/fifth-leg-font/opensuse-font-fifth-leg-$pkgver.tar.bz2")
md5sums=('5a9852e078b4c9ccd8fe5c472bba1184')
install=$pkgname.install

package() {
	install -d $pkgdir/usr/share/fonts/OTF/
	install -d $pkgdir/usr/share/licenses/$pkgname/
	install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
	install -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/
}
