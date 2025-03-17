# Maintainer: Mercas <me@smj.im>

pkgname=ttf-jetbrains-maple-mono-nf-xx-xx
pkgver="1.2304.70_beta36"
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=('any')
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=('OFL')
source=("https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/pre/JetBrainsMapleMono-NF-XX-XX.zip")
sha256sums=('a01730ac90cf6fbfa67aaec3b2432308ec9f96977587fef17495c100a1f7e247')

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
