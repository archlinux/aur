# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgbase=nordwand-mono
pkgname=('ttf-nordwand-mono' 'otf-nordwand-mono')
pkgver=1.5.2
pkgrel=1
pkgdesc="Compact monospace neo-grotesque font designed for developers"
arch=('any')
url="https://github.com/tywr/Nordwand-Mono"
license=('OFL-1.1')
depends=('fontconfig')
install=nordwand-mono.install

source=(
  "NordwandMono-TTF-$pkgver.zip::$url/releases/download/$pkgver/NordwandMono-TTF.zip"
  "NordwandMono-OTF-$pkgver.zip::$url/releases/download/$pkgver/NordwandMono-OTF.zip"
  "LICENSE-FONT-$pkgver.txt::https://raw.githubusercontent.com/tywr/Nordwand-Mono/$pkgver/LICENSE-FONT.txt"
)
sha256sums=('733880c59cf8227cdba6ef284ca58fd524a839b2c51a8c5abeaecb078e3a84fb'
            '3b33d3a3861d4d8308f01183725fb1709007733dca0973ff80e35787d594b742'
            'e0e493edae714ad5bb243a346f3fd45ecdd94a00584118297f2d05e0f6187d38')

package_ttf-nordwand-mono() {
  install -Dm644 "$srcdir"/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/LICENSE-FONT-$pkgver.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-FONT.txt"
}

package_otf-nordwand-mono() {
  install -Dm644 "$srcdir"/*.otf -t "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 "$srcdir/LICENSE-FONT-$pkgver.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-FONT.txt"
}
