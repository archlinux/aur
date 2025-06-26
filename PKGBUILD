# Maintainer: pcmid <plzcmid at gmail dot com>

pkgname=ttf-jetbrains-maple-mono-xx-xx-xx
pkgver=1.2304.73
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=(any)
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=(OFL)
provides=(ttf-jetbrains-maple-mono)
conflicts=(ttf-jetbrains-maple-mono)
source=("JetBrainsMapleMono-XX-XX-XX-${pkgver}.zip::https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/${pkgver}/JetBrainsMapleMono-XX-XX-XX.zip")
sha256sums=('111d645d5aa67a3274d862ec40178c22d66a0379aef0e131cda1cad363c51004')

package() {
  find . -type f -name "*.ttf" -exec \
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" {} \;
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
