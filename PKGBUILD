# Maintainer: pcmid <plzcmid at gmail dot com>

pkgname=ttf-jetbrains-maple-mono-xx-xx-xx
pkgver=1.2304.70
pkgver_append="-beta36"
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=(any)
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=(custom:OFL)
provides=(ttf-jetbrains-maple-mono)
conflicts=(ttf-jetbrains-maple-mono)
source=("https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/${pkgver}${pkgver_append}/JetBrainsMapleMono-XX-XX-XX.zip")
sha256sums=('245cf9d4959eb99e8f4bc910ca1f72755373dd05f3ac9481aba78bfdb02875e1')

package() {
  find . -type f -name "*.ttf" -exec \
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" {} \;
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
