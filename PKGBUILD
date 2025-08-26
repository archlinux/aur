# Maintainer: Mercas <me@smj.im>

pkgname=ttf-jetbrains-maple-mono-nf-xx-xx
pkgver="1.2304.76"
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=('any')
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=('OFL')
source=("https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/${pkgver}/JetBrainsMapleMono-NF-XX-XX.zip")
sha256sums=('49c6c3911a258e166614f732e4bc04ddf68d5cda59b8eaade79cdde7f016a777')

package() {
  _fontname=JetBrains-Maple-Mono-NF-XX-XX
  # Create font directory
  install -dm755 "$pkgdir/usr/share/fonts/TTF"

  # Install all font files
  for font in *.ttf; do
    install -Dm644 "$font" "$pkgdir/usr/share/fonts/TTF/${_fontname}/$font"
  done

  # Install license file
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${_fontname}/LICENSE.txt"
}
