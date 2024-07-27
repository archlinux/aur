# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=crackstation-human-only
pkgver=2019.05.26
pkgrel=1
pkgdesc="CrackStation's \"real human\" passwords leaked from various website databases"
arch=('any')
url='https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm'
license=('CC-BY-SA-3.0')
source=('https://crackstation.net/files/crackstation-human-only.txt.gz')
sha256sums=('201f8815c71a47d39775304aa422a505fc4cca18493cfaf5a76e608a72920267')

package() {
	install -Dm644 crackstation-human-only.txt "$pkgdir/usr/share/dict/crackstation-human-only.txt"
}
