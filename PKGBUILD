# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgbase=nordwand-mono
pkgname=('ttf-nordwand-mono' 'otf-nordwand-mono')
pkgver=1.3.3
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
sha256sums=('d9955d0b1b924e11fd822ceb23986a1253d83b00d9e66aa97c6439c6ccfb8913'
            '24182377ff4f746d1f05f3dadb11c6a4718132a15b968f000901f0b803183d16'
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
