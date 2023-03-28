# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=papa
pkgname=$_pkgname-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Mod manager CLI for Northstar (binary release)"
arch=('x86_64')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
_url2=https://raw.githubusercontent.com/AnActualEmerald/papa/2d5810d367b416af1a5fd0f43358f0a1e5a0978e
source=("$url/releases/download/v$pkgver/papa"
        "$_url2/CHANGELOG.md"
        "$_url2/LICENSE"
        "$_url2/README.md")
sha256sums=('88c9a21aee576a85c35d40fb86104d2f6d4d90b46ac5764ab47048d3dc262904'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 papa -t "$pkgdir/usr/bin"
}
