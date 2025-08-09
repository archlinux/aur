# Maintainer: Mercas <me@smj.im>

pkgname=ttf-jetbrains-maple-mono-nf-xx-xx
pkgver="1.2304.75"
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=('any')
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=('OFL')
source=("https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/${pkgver}/JetBrainsMapleMono-NF-XX-XX.zip")
sha256sums=('407c4a6da3f7507b0fa03d881f508292028ce214928c1b819e9ad354d7b555de')

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
