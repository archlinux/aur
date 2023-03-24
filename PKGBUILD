# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=papa
pkgname=${_pkgname}-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="A cli mod manager for the Northstar launcher (binary release)"
arch=('any')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_commit=ecb6306027e12007da86541fbdac145fa69bc2d4

source=("https://github.com/AnActualEmerald/papa/releases/download/v$pkgver/papa"
        "https://raw.githubusercontent.com/AnActualEmerald/papa/$_commit/CHANGELOG.md"
        "https://raw.githubusercontent.com/AnActualEmerald/papa/$_commit/LICENSE"
        "https://raw.githubusercontent.com/AnActualEmerald/papa/$_commit/README.md")
sha256sums=('0d00b8afbaafce809d2d36123e50bf23c1518cffc093aca12b81e02319793caf'
            '645dbd5e1f9a6d863b3d233b729e57095082e61d612eeb384b2894bfe2766071'
            'b6558cba3beba86187261c81219ae2bbb69273c325ade0d7f41c24ebc17dc9c2'
            '8ee6662dbc213e1a0bbaaeabd8193f8abc8c06180ca8889dd0f01cf700aeabf3')

package() {
  install -Dm 755 papa -t "$pkgdir/usr/bin"
  install -Dm 644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
