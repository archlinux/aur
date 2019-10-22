# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-bash-bin'
pkgver=1.0.24
pkgrel=1
pkgdesc="Dhall to bash compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

_dhall_ver=1.27.0

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-bash-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-bash/LICENSE")
sha256sums=('2443c03b020383e5e069ccca23cedec95498c6fb9c797edb84a4225887e78682'
            '681f75c2ab1536a01a914b1be992d1694023abe2b81c0217a6cfbd2e08a7c506')

function package {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-bash"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
