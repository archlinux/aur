# Maintainer: travismtg <travismtg@outlook.com>

pkgname=gptcommit-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="A git prepare-commit-msg hook for authoring commit messages with GPT-3."
arch=('any')
url='https://github.com/zurawiki/gptcommit'
license=('MIT')
depends=()
conflicts=('gptcommit-git' 'gptcommit')


source=('https://github.com/zurawiki/gptcommit/releases/download/v0.5.8/gptcommit-x86_64-unknown-linux-gnu.tar.gz')

sha256sums=('d0efe345dd4b598a8c06bd9ba7036ae4e148141deb606c64e612e8959273cedc')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin/"
    tar zxvf gptcommit-x86_64-unknown-linux-gnu.tar.gz -C "$pkgdir/usr/bin/"
}

