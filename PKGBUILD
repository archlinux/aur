# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=keepassxc-wordlist-eyeware
pkgver=1.0
pkgrel=1
pkgdesc="'The Lord of the Rings'-based diceware wordlist for keepassxc"
arch=('any')
url="https://github.com/nightsense/eyeware"
license=('GPL')
depends=('keepassxc>=2.2.0')
source=("https://gitlab.com/chrpinedo/eyeware/-/raw/master/eyeware8k")
sha256sums=("a264c135bcb5b13792ea516dc93f43cb1cf364ea38167f0ef5d79a75471b5da3")

package() {
    install -Dm644 $srcdir/eyeware8k \
	$pkgdir/usr/share/keepassxc/wordlists/eyeware.wordlist
}
