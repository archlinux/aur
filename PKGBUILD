# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=crackstation
pkgver=2019.05.26
pkgrel=1
pkgdesc="CrackStation's password cracking dictionary"
arch=('any')
url='https://crackstation.net/crackstation-wordlist-password-cracking-dictionary.htm'
license=('CC-BY-SA-3.0')
source=('https://crackstation.net/files/crackstation.txt.gz')
sha256sums=('a6dc17d27d0a34f57c989741acdd485b8aee45a6e9796daf8c9435370dc61612')

package() {
	install -Dm644 crackstation.txt "$pkgdir/usr/share/dict/crackstation.txt"
}
