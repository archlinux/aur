# Maintainer: BullShark <BullShark@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=jspeak
_pkgname=JSpeak
pkgver=2020.7.26
pkgrel=1
pkgdesc='A Text to Speech Reader Front-end that Reads from the Clipboard and with Exceptionable Features '
arch=('any')
url="https://github.com/BullShark/$_pkgname"
license=('GNU General Public License v3.0')
depends=('espeak' 'mbrola')
source=("https://github.com/downloads/BullShark/$_pkgname/$_pkgname.tbz")
sha256sums=('SKIP')

package() {
  mkdir -p $pkgdir/usr/local
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/local/bin $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/$pkgname-$pkgver-$pkgrel/usr/lib/jspeak $pkgdir/usr/lib/jspeak
}