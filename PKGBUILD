# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-bash-bin'
pkgver=1.0.22
pkgrel=1
pkgdesc="Dhall to bash compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

_dhall_ver=1.25.0

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-bash-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-bash/LICENSE")
sha256sums=('66de50ea77f1f91853065e494dc87d022f95a53068700f519c63762399c289a0'
            '681f75c2ab1536a01a914b1be992d1694023abe2b81c0217a6cfbd2e08a7c506')

function package {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-bash"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
