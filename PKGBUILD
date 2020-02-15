# Maintainer: amesgen <amesgen AT amesgen DOT de>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-lsp-server-bin'
pkgver=1.0.5
pkgrel=1
pkgdesc="Language Server Protocol implementation for Dhall"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

_dhall_ver=1.30.0

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-lsp-server-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-lsp-server/LICENSE")
sha256sums=('278d5cc1874c99a66ee382d39273b015b16c861e81fae5b417d61a8d926ff12d'
            'adeacdbe96b7b9f8f9fbb1db9b31f77792e603180484dfe4a5c52bc5496e2046')

package() {
  install -Dm755 "$srcdir/bin/dhall-lsp-server" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
