# Maintainer:

_fontname="firamath"
_pkgname="otf-$_fontname"
pkgname="$_pkgname"
pkgver=0.3.4
pkgrel=1
pkgdesc="A sans-serif font with Unicode math support, forked from Fira Sans"
url="https://github.com/firamath/firamath"
license=('OFL-1.1-no-RFN')
arch=('any')

source=(
  "$_fontname-$pkgver-regular.otf"::"$url/releases/download/v$pkgver/FiraMath-Regular.otf"
  "$_fontname-$pkgver-LICENSE.txt"::"$url/raw/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
  '2028cbd3dd4d8c0cf1608520eb4759956a83a67931d7b6d8e7c313520186e35b'
  '573c14d3ddf557b59bf1fb5537a116a85f264654cdb9ba194ac305acd8ce5dc6'
)

package() {
  install -Dm644 "$_fontname-$pkgver-regular.otf" "$pkgdir/usr/share/fonts/OTF/FiraMath-Regular.otf"
  install -Dm644 "$_fontname-$pkgver-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
