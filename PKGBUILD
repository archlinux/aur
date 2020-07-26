# Maintainer: BullShark <BullShark@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=jspeak
_pkgname=JSpeak
pkgver=2020.7.26
pkgrel=2
pkgdesc='A Text to Speech Reader Front-end that Reads from the Clipboard and with Exceptionable Features '
arch=('any')
url="https://github.com/BullShark/$_pkgname"
license=('GNU General Public License v3.0')
depends=('espeak' 'mbrola')
optdepends=('mbrola-voices-us1' 'mbrola-voices-us2' 'mbrola-voices-us3')
source=("https://github.com/BullShark/$_pkgname/releases/download/$pkgver-$pkgrel/$_pkgname.tbz")
sha256sums=('SKIP')

package() {
  mkdir -p $pkgdir/usr/local
	cp -a $srcdir/usr/local/bin $pkgdir/usr/local/bin
  chmod +x $pkgdir/usr/local/bin/$pkgname
  mkdir -p $pkgdir/usr/lib
	cp -a $srcdir/usr/lib/jspeak $pkgdir/usr/lib/jspeak
}