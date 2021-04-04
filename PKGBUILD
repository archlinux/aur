# Maintainer: Zoey Sheffield <me at zoey dot fyi>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='boop-gtk-bin'
pkgver='1.7.0'
pkgrel='2'
pkgdesc="A scriptable scratchpad for developers."
arch=('x86_64')
conflicts=('boop-gtk')
provides=('boop-gtk=1.7.0')
url='https://github.com/zoeyfyi/Boop-GTK'
license=('MIT')
depends=(
  'gtksourceview3'
  'gtk3'
)
source=(
  "boop-gtk.$pkgver::$url/releases/download/v$pkgver/boop-gtk.linux.amd64"
  "boop-gtk.$pkgver.desktop::$url/raw/v$pkgver/data/fyi.zoey.Boop-GTK.desktop"
  "boop-gtk.$pkgver.svg::$url/raw/v$pkgver/data/fyi.zoey.Boop-GTK.svg"
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
  install -Dm755 "boop-gtk.$pkgver" "$pkgdir/usr/bin/boop-gtk"
  install -Dm644 "boop-gtk.$pkgver.desktop" "$pkgdir/usr/share/applications/fyi.zoey.Boop-GTK.desktop"
  install -Dm644 "boop-gtk.$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/fyi.zoey.Boop-GTK.svg"
  install -Dm644 "README.$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE.$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
