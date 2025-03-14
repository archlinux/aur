# Maintainer: Mercas <me@smj.im>

pkgname=ttf-jetbrains-maple-mono-nf-xx-xx
pkgver="1.2304.70_beta36"
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=('any')
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=('OFL')
source=("https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download//JetBrainsMapleMono-NF-XX-XX.zip")
sha256sums=('b36550bf86ba538d2d6249b9d91c0d345fd4b1a32291ffc9ba15427e05ad3f1b')

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
