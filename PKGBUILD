# Maintainer: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-bin'
pkgver=1.28.0
pkgrel=1
pkgdesc="Dhall typechecker and formatter"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$pkgver/dhall-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$pkgver/dhall/LICENSE")
sha256sums=('58cf2a27384a83298e3b1de7a6841143cbc1b8e6021aee953528807dd7b1b4e8'
            '681f75c2ab1536a01a914b1be992d1694023abe2b81c0217a6cfbd2e08a7c506')

function package {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
