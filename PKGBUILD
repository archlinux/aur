pkgname=keepassxc-wordlist-german-better
pkgver=1.0
pkgrel=2
pkgdesc="Better German diceware wordlist for keepassxc password generation"
arch=('any')
url="https://github.com/dys2p/wordlists-de"
license=('CC0')
depends=('keepassxc>=2.2.0')
source=("https://raw.githubusercontent.com/dys2p/wordlists-de/main/de-7776-v1.txt")
sha256sums=('f33248601c0e165fd3e430fbfc431558cbbe20121cb37e3bcaa934820e02c176')

package() {
    install -Dm644 $srcdir/de-7776-v1.txt $pkgdir/usr/share/keepassxc/wordlists/german-better.wordlist
}
