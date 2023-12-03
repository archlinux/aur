# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

_gitname=satstack
pkgname=satstack-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Use Ledger Live with your Bitcoin full node"
arch=('x86_64')
url="https://github.com/LedgerHQ/${_gitname}"
license=('BSD-2')
source=("https://github.com/LedgerHQ/satstack/releases/download/v${pkgver}/satstack_${pkgver}_Linux-amd64.tar.gz")
b2sums=('9c50d7421653a84ef4bb0f6c89376377da9d03105d8a5fba34d07a41b30f20b7e651dbb5ad51c891e517fbbb51a08c6a54f6f360a41e503b0dc05d9361af60e8')

package() {
  cd "$srcdir"

  install -Dm755 lss "$pkgdir/usr/bin/lss"
}
