# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=ferrite-bin
pkgver=0.2.5
pkgrel=1
pkgdesc='A fast, lightweight text editor for Markdown, JSON, YAML, and TOML files.'
arch=('x86_64')
url=https://github.com/OlaProeis/Ferrite
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver/"
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

sha256sums=('f2371fddd25f3b97c0fe9265ab9fb208ade57bf441860ff196a8b893a567c2e3'
            'c94952dae4438b71667a129c1f7dd0e196e6d7dbf37db4525511c69536c27ac1'
            '79415739aa458c27bfb595d40ce73d81d81aae81fb53771d978209b6f193c7b2'
            '05279abdddba55be75e38fd990f2a7fd475fbc189069183aabac79a9aa9818f5'
            'efcdd9b5d8664ed8e03a67795b9bc7a9dddfdfee405a8060c2cad5c89935b6df'
            'd1a548a61b5187142e30d16ee8ea8729edaebf6fd8df27da9f1bd077209c323d'
            '896cd9a84df9a790889be5005a1dee6083d142b6aac3f4706fd5749461678161'
            '7286286c024f1f8a529749bbc63fb4de75a48af04551e40fdd6ded9494e2ab41'
            '74a3353eeed0352c572d1ff8b2209eedf32a8948d68c5d27661902d8de390caf'
            '805054dd6cafed38a2346816ae65e5604561332754354fd0d5d599f0d2bda52c')

package() {
  install -Dm0755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "ferrite_$pkgver.desktop" "$pkgdir/usr/share/applications/ferrite.desktop"
  install -Dm644 "ferrite_16_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/ferrite.png"
  install -Dm644 "ferrite_32_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/ferrite.png"
  install -Dm644 "ferrite_48_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/ferrite.png"
  install -Dm644 "ferrite_64_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/ferrite.png"
  install -Dm644 "ferrite_128_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/ferrite.png"
  install -Dm644 "ferrite_256_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ferrite.png"
  install -Dm644 "ferrite_512_$pkgver.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/ferrite.png"
}
