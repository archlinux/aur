# Maintainer: Thomas Eizinger <thomas@eizinger.io>

# All my PKGBUILDs are managed at https://github.com/thomaseizinger/pkgbuilds

_gitname=satstack
pkgname=satstack-bin
pkgver=0.12.0
pkgrel=0
pkgdesc="Use Ledger Live with your Bitcoin full node"
arch=('x86_64')
url="https://github.com/LedgerHQ/${_gitname}"
license=('BSD-2')
source=("https://github.com/LedgerHQ/satstack/releases/download/v${pkgver}/satstack_${pkgver}_Linux-amd64.tar.gz")
sha256sums=('f9eee553d86ebdbc53213e874650eea54583f5b0e55e36b986b5839126b6809e')

package() {
  cd "$srcdir"

  install -Dm755 lss "$pkgdir/usr/bin/lss"
}
