# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='httplz-bin'
_pkgname='httplz'
pkgver='1.11.2'
pkgrel='1'
pkgdesc='Host These Things Please - a basic http server for hosting a folder fast and simply'
arch=('x86_64')
url="https://github.com/thecoshman/http"
license=('MIT')
source=(
  "$url/releases/download/v$pkgver/http-v$pkgver"
  "$url/releases/download/v$pkgver/http-man-v$pkgver.tbz2"
  "$url/raw/v$pkgver/LICENSE"
)
sha512sums=(
  'b3513212ac37e87a0a605773ec26943f8d245db0a56b0575d7b13f8210fb77b9ff0202170ee2a1231b9dd54ddb1a5bab4accdfd5da5f48be3445b03c98d4067b'
  'cdf5de45fc6dfa76e08c79bab6290a4849d8544a00367affc2b00148973d6ffbb64698fb9b2b2df7fc4b2e960b12968f7f629854624ba584ffa0d1f4e881cbba'
  '7de80a15c7cb00d6980e0722256c84df6f11137f4b76840ddbb145c4cb2a717733b43098d97e728c78b9bfc1414a7255194cd7dd10c89fe138eb1ed90907614b'
)

package() {
  install -Dm755 "http-v$pkgver" "$pkgdir/usr/bin/httplz"
  install -Dm644 "http-man-v$pkgver/http.1" "$pkgdir/usr/share/man/man1/httplz.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
