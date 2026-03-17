# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=ferrite-bin
pkgver=0.2.7
pkgrel=2
pkgdesc='A fast, lightweight text editor for Markdown, JSON, YAML, and TOML files.'
arch=('x86_64')
url=https://github.com/OlaProeis/Ferrite
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=('MIT')
depends=(glibc gcc-libs zlib hicolor-icon-theme fontconfig)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
	"$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-x64.tar.gz"
	"LICENSE_$pkgver::$_rawurl/LICENSE"
	"ferrite_$pkgver.desktop::$_rawurl/assets/icons/linux/ferrite.desktop"
  "ferrite_16_$pkgver.png::$_rawurl/assets/icons/linux/16x16/ferrite.png"
  "ferrite_32_$pkgver.png::$_rawurl/assets/icons/linux/32x32/ferrite.png"
  "ferrite_48_$pkgver.png::$_rawurl/assets/icons/linux/48x48/ferrite.png"
  "ferrite_64_$pkgver.png::$_rawurl/assets/icons/linux/64x64/ferrite.png"
  "ferrite_128_$pkgver.png::$_rawurl/assets/icons/linux/128x128/ferrite.png"
  "ferrite_256_$pkgver.png::$_rawurl/assets/icons/linux/256x256/ferrite.png"
  "ferrite_512_$pkgver.png::$_rawurl/assets/icons/linux/512x512/ferrite.png"
)

sha256sums=('f1aea7ce420a2b35e988b29e90ee58ce4bce0179834255f8e27710e5a134d2bc'
            'c94952dae4438b71667a129c1f7dd0e196e6d7dbf37db4525511c69536c27ac1'
            '79415739aa458c27bfb595d40ce73d81d81aae81fb53771d978209b6f193c7b2'
            '2e6a7b55e4bf576c3ba6619b66175dcd82df94852056a1ab3512d80ddb1e1532'
            '873575a20f30617cb3f390f928f7f5de33d6fceabdafc22a04696b3ee3213c35'
            'bbca9cd1b71d27da12ac2ca781d7b4689d55447e19d901b719e40f69514e1fec'
            '446158f806f055b44077104e329e25eab8f5127025ec281bd6ad90f77f34dd36'
            'bf4c13e9620367fbcf3b2a752cfe3bb5a3865cc8fc8d18e68746b4319f42a7d8'
            '67a0be457ccc23f03d75bf66c293237247e46bfc6b9bf5355fab3d89090b8397'
            'c7eb21f49d55b8d9999dc56ea670b0e9e7a77af631e1afac0a22a519d154549a')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "ferrite_$pkgver.desktop" "$pkgdir/usr/share/applications/ferrite.desktop"
  install -Dm644 "ferrite_16_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/ferrite.png"
  install -Dm644 "ferrite_32_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/ferrite.png"
  install -Dm644 "ferrite_48_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/ferrite.png"
  install -Dm644 "ferrite_64_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/ferrite.png"
  install -Dm644 "ferrite_128_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/ferrite.png"
  install -Dm644 "ferrite_256_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ferrite.png"
  install -Dm644 "ferrite_512_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ferrite.png"
}
