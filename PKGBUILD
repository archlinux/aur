# Maintainer: Jan Rydzewski <flegmer@gmail.com>

pkgname='dhall-json-bin'
pkgver=1.7.0
pkgrel=1
pkgdesc="Dhall to JSON compiler and a Dhall to YAML compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')

_dhall_ver=1.33.1

source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-json-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-json/LICENSE")
sha256sums=("SKIP"
            "SKIP")

function package {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-json"
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-yaml"
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/json-to-dhall"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
