# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-lsp-server-bin'
pkgver=1.0.3
pkgrel=1
pkgdesc="Language Server Protocol implementation for Dhall"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

_dhall_ver=1.28.0

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-lsp-server-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-lsp-server/LICENSE")
sha256sums=('dc36a0681a08ea514512313f8ff94cf556e46416c7b93c60c3f765fe4a38ab65'
            'adeacdbe96b7b9f8f9fbb1db9b31f77792e603180484dfe4a5c52bc5496e2046')

function package {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-lsp-server"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
