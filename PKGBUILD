# Maintainer: travismtg <travismtg@outlook.com>

pkgname=gptcommit-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="A git prepare-commit-msg hook for authoring commit messages with GPT-3."
arch=('any')
url='https://github.com/zurawiki/gptcommit'
license=('MIT')
depends=()
conflicts=('gptcommit-git' 'gptcommit')


source=('https://github.com/zurawiki/gptcommit/releases/download/v0.5.9/gptcommit-x86_64-unknown-linux-gnu.tar.gz')

sha256sums=('0292d015d6a6e3b72e18fa07d473189f9e19dd025cf6d18dfada34b89009372a')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin/"
    tar zxvf gptcommit-x86_64-unknown-linux-gnu.tar.gz -C "$pkgdir/usr/bin/"
}

