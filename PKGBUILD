# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Chad Davis <archlinux@davtek.com>

pkgname=otf-fifthleg
pkgver=0.6
pkgrel=7
pkgdesc='Font used for openSUSE-branded material'
arch=('i686' 'x86_64')
license=('custom:OFL')
url='http://jimmac.musichall.cz/log/?p=440'
depends=('fontconfig' 'xorg-font-utils')
source=("https://api.opensuse.org/public/source/openSUSE:Factory/fifth-leg-font/opensuse-font-fifth-leg-$pkgver.tar.bz2")
sha256sums=('2facb31148078fa17264ce5bcd6c30e59769150f0b7d6c6536de15bb3f2c5f55')

package() {
	install -d $pkgdir/usr/share/fonts/OTF/
	install -d $pkgdir/usr/share/licenses/$pkgname/
	install -m644 *.otf $pkgdir/usr/share/fonts/OTF/
	install -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/
}
