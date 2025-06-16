# Maintainer: Mercas <me@smj.im>

pkgname=ttf-jetbrainsmaplemono-nf-xx-xx
pkgver="1.2304.73"
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=('any')
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=('OFL')
source=("https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/$pkgver/JetBrainsMapleMono-NF-XX-XX.zip")
sha256sums=('533c804b44a5379fd163eb55664f1be44b3ef04b578031c12684bffd8624353b')

package() {
  # Create font directory
  install -dm755 "$pkgdir/usr/share/fonts/TTF"

  # Install all font files
  for font in *.ttf; do
    install -Dm644 "$font" "$pkgdir/usr/share/fonts/TTF/$font"
  done

  # Install license file
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
