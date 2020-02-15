# Maintainer: amesgen <amesgen AT amesgen DOT de>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-bin'
pkgver=1.30.0
pkgrel=1
pkgdesc="Dhall typechecker and formatter"
arch=('x86_64')
_repo='dhall-lang/dhall-haskell'
url="https://github.com/$_repo"
license=('BSD')
source=("$url/releases/download/$pkgver/dhall-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/$_repo/$pkgver/dhall/LICENSE")
sha256sums=('6845421de9c3cc40f4140a1278c408df8ef49bf8086ee7f37730d2eda8ce9402'
            '681f75c2ab1536a01a914b1be992d1694023abe2b81c0217a6cfbd2e08a7c506')

package() {
  install -Dm755 "$srcdir/bin/dhall" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
