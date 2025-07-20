# Maintainer:

_pkgname="otf-firamath"
pkgname="$_pkgname"
pkgver=0.3.4
pkgrel=1
pkgdesc="Fira Math is a sans-serif font with Unicode math support"
url="https://github.com/firamath/firamath"
license=('OFL-1.1-no-RFN')
arch=('any')

source=(
  "$_pkgname-$pkgver-regular.otf"::"$url/releases/download/v$pkgver/FiraMath-Regular.otf"
  "$_pkgname-$pkgver-LICENSE.txt"::"$url/raw/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
  '2028cbd3dd4d8c0cf1608520eb4759956a83a67931d7b6d8e7c313520186e35b'
  '573c14d3ddf557b59bf1fb5537a116a85f264654cdb9ba194ac305acd8ce5dc6'
)

package() {
  install -Dm644 "$_pkgname-$pkgver-regular.otf" "$pkgdir/usr/share/fonts/OTF/FiraMath-Regular.otf"
  install -Dm644 "$_pkgname-$pkgver-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
