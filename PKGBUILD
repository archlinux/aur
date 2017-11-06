# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=yatoc2cue
pkgver=0.7
_pkgver=07
pkgrel=3
pkgdesc="converts a cdrdao .toc file to a .cue as known from tools like EAC"
arch=('any')
url="http://yatoctocue.sourceforge.net"
license=('GPL')
depends=('perl' 'perl-switch')
source=("https://astuteinternet.dl.sourceforge.net/project/$pkgname/v$pkgver/$pkgname$_pkgver.tar.bz2")
sha256sums=('90bff56479a3e15cd1e536449611cea63d6f84132b2af5d0e3c3ddabd4b8d747')

package() {
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
