# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-bin'
pkgver=1.24.0
pkgrel=1
pkgdesc="Dhall typechecker and formatter"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$pkgver/dhall-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$pkgver/dhall/LICENSE")
sha256sums=("d85d2703b52220afbf2dbc1e7a5ada05fe07e8b1d912c9011a4bee819ac36612"
            "SKIP")

function package {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
