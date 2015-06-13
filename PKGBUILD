# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Erus

pkgname=erusfont
pkgver=0.7
pkgrel=1
pkgdesc='A bitmap font for programming and terminal/tty use, greatly inspired from montecarlo and gohufont, many thanks to their creator'
arch=(any)
url=http://perdu.com/
license=(custom:WTFPL)
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
#optdepends=('xorg18-localfontdir-conf: If you are lazy and dont want to create yourself a 4line file in your xorg.conf.d')
install=$pkgname.install
source=('http://kmkeen.com/tmp/erusfont.src.tar.gz')
md5sums=('b9b47d2d6743c608b709a4a5dce86033')

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 erusfont.psf.gz "$pkgdir/usr/share/kbd/consolefonts/erusfont.psf.gz"
	install -Dm644 erusfont.pcf.gz "$pkgdir/usr/share/fonts/local/erusfont.pcf.gz"
	install -Dm644 erusfontbold.pcf.gz "$pkgdir/usr/share/fonts/local/erusfontbold.pcf.gz"
	install -Dm644 COPYING-LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING-LICENSE"
}
