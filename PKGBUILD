# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-lsp-server-bin'
pkgver=1.0.0
pkgrel=2
pkgdesc="Language Server Protocol implementation for Dhall"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

_dhall_ver=1.25.0

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-lsp-server-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-lsp-server/LICENSE")
sha256sums=('84f9f722abef989e02da6257bcb115e901487cd8d1b64fbf1f5a4286d8f60555'
            'SKIP')

function package {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-lsp-server"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
