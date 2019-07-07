# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-text-bin'
pkgver=1.0.18
pkgrel=1
pkgdesc="Dhall to text compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

_dhall_ver=1.24.0

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-text-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-text/LICENSE")
sha256sums=("4abb8c8b71d4bf35c52fcfb943d4ed279aa4662055ef0344c791e4c4e86b79b4"
            "SKIP")

function package {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-text"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
