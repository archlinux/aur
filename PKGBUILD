pkgname=keepassxc-wordlist-german-better
pkgver=1.0
pkgrel=3
pkgdesc="Better German diceware wordlist for keepassxc password generation"
arch=('any')
url="https://github.com/dys2p/wordlists-de"
license=('CC0')
depends=('keepassxc>=2.2.0')
source=("https://raw.githubusercontent.com/dys2p/wordlists-de/main/de-7776-v1.txt")
sha256sums=('440fa02c65591328d6351435d3824c27b483a049f4eca0b13456d8c5090442e7')

package() {
    install -Dm644 $srcdir/de-7776-v1.txt $pkgdir/usr/share/keepassxc/wordlists/german-better.wordlist
}
