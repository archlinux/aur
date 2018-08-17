# Maintainer: David Vogt <d@408.ch>

pkgname=git-bug
pkgver=0.2.0
pkgrel=1
pkgdesc="Distributed bug tracker embedded in Git"
arch=('x86_64' 'i686')
url="https://github.com/MichaelMure/git-bug"
license=('GPLv3')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/MichaelMure/$pkgname/releases/download/$pkgver/git-bug_linux_amd64")
sha256sums=('5d85c2b9f54fd2cbc119bbb7bf9f597bd7648a8608c53b58e93da43f1c1e55c9')

build() {
  true
}

package() {
  install -Dm755 git-bug_linux_amd64 "$pkgdir/usr/bin/git-bug"
}

# vim:set ts=2 sw=2 et:
