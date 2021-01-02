# Maintainer: Zoey Sheffield <me@zoey.fyi>

pkgname='tex-match-bin'
pkgver='1.2.0'
pkgrel='1'
pkgdesc="Find LaTeX symbols by sketching. A desktop version of detexify."
arch=('x86_64')
conflicts=('tex-match')
provides=("tex-match=$pkgver")
url='https://github.com/zoeyfyi/TeX-Match'
license=('MIT')
depends=('gtk3')
source=(
  "tex-match.$pkgver::$url/releases/download/v$pkgver/tex-match.linux.amd64"
  "tex-match.$pkgver.desktop::$url/raw/v$pkgver/data/fyi.zoey.TeX-Match.desktop"
  "tex-match.$pkgver.svg::$url/raw/v$pkgver/data/fyi.zoey.TeX-Match.svg"
  "README.$pkgver.md::$url/raw/v$pkgver/README.md"
  "LICENSE.$pkgver::$url/raw/v$pkgver/LICENSE"
)
sha512sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "tex-match.$pkgver" "$pkgdir/usr/bin/tex-match"
  install -Dm644 "tex-match.$pkgver.desktop" "$pkgdir/usr/share/applications/fyi.zoey.TeX-Match.desktop"
  install -Dm644 "tex-match.$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/fyi.zoey.TeX-Match.svg"
  install -Dm644 "README.$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE.$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
