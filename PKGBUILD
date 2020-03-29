# Maintainer: amesgen <amesgen AT amesgen DOT de>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-lsp-server-bin'
pkgver=1.0.6
pkgrel=1
pkgdesc="Language Server Protocol implementation for Dhall"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

_dhall_ver=1.31.0

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-lsp-server-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-lsp-server/LICENSE")
sha256sums=('b1fca05fe0b53c891cd4d39d2cbfe700b30f59a05f93945e20841da5ac2eadba'
            '9e2f0e499b5406faffffd32d0a1d69d519dc8c681fb0648ee5e9970e0299d4a7')

package() {
  install -Dm755 "$srcdir/bin/dhall-lsp-server" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
