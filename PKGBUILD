# Maintainer: TheCrabeuh <clement.dallasenn@outlook.fr>
# Contributor: catboy

pkgname=fren-bin
pkgver=2.0
pkgrel=1
pkgdesc="A TUI file manager that lets you open files and directories with any app (binary release)"
arch=('x86_64')
url="https://github.com/TheCrabevariable/fren"
license=('MIT')
depends=('glibc' 'xdg-utils' 'chafa')
optdepends=(
  "noto-fonts-emoji: for emoji icons"
  "ttf-jetbrains-mono-nerd: for Nerd icon mode"
)
source=(
  "$url/releases/download/TUI/fren"
  "$url/raw/main/assets/fren.desktop"
  "$url/raw/main/assets/fren.png"
)
sha256sums=(
  '0642fd9ab16d40ba56b58bce677cf5c01f39139a0af2bd14a21119b6e4b4b33c'
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$srcdir/fren" "$pkgdir/usr/bin/fren"
  install -Dm644 "$srcdir/fren.desktop" \
    "$pkgdir/usr/share/applications/fren.desktop"
  install -Dm644 "$srcdir/fren.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/fren.png"
}
