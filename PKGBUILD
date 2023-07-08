# Maintainer: travismtg <travismtg@outlook.com>

pkgname=gptcommit-bin
pkgver=0.5.10
pkgrel=1
pkgdesc="A git prepare-commit-msg hook for authoring commit messages with GPT-3."
arch=('any')
url='https://github.com/zurawiki/gptcommit'
license=('MIT')
depends=()
conflicts=('gptcommit-git' 'gptcommit')


source=('https://github.com/zurawiki/gptcommit/releases/download/v0.5.10/gptcommit-x86_64-unknown-linux-gnu.tar.gz')

sha256sums=('79dc7d07411eb1b97da0c402e91a8824040cb73185d5137292ff22f0ea008844')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin/"
    tar zxvf gptcommit-x86_64-unknown-linux-gnu.tar.gz -C "$pkgdir/usr/bin/"
}

