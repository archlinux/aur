# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=papa
pkgname=$_pkgname-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="Mod manager CLI for Northstar (binary release)"
arch=('x86_64')
url="https://github.com/AnActualEmerald/papa"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
_url2=https://raw.githubusercontent.com/AnActualEmerald/papa/72fbd2c09c0ca4eaa65499135ba760d6995a1f0d
source=("$url/releases/download/v$pkgver/papa"
        "$_url2/CHANGELOG.md"
        "$_url2/LICENSE"
        "$_url2/README.md")
sha256sums=('bc1c667ea69b35ce3923b7338c4a66e7286f20d9bd8b3a0808944f31e8aad64d'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 papa -t "$pkgdir/usr/bin"
}
