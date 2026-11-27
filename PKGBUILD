# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgbase=helix-mono
pkgname=('ttf-helix-mono' 'woff2-helix-mono')
pkgver=1.0
pkgrel=1
arch=('any')
url="https://github.com/HelixDB/helix-mono"
license=('OFL-1.1')
source=("HelixMono-$pkgver.zip::https://github.com/HelixDB/helix-mono/releases/download/v$pkgver/HelixMono-$pkgver.zip")
sha256sums=('f163b110b1d9fd87fcf5fed69fd20491b8b46170bffd93d4e1db0df5548fdb80')

package_ttf-helix-mono() {
  pkgdesc="Monospace typeface by HelixDB (TTF format)"
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/HelixMono/ttf/"*.ttf
  install -Dm644 "$srcdir/HelixMono/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_woff2-helix-mono() {
  pkgdesc="Monospace typeface by HelixDB (WOFF2 format, for the web)"
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/HelixMono/woff2/"*.woff2
  install -Dm644 "$srcdir/HelixMono/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
