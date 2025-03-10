# Maintainer: pcmid <plzcmid at gmail dot com>

pkgname=ttf-jetbrains-maple-mono-xx-xx-ht
pkgver=1.2304.70
pkgver_append="-beta36"
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=(any)
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=(custom:OFL)
provides=(ttf-jetbrains-maple-mono)
conflicts=(ttf-jetbrains-maple-mono)
source=("https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/${pkgver}${pkgver_append}/JetBrainsMapleMono-XX-XX-HT.zip")
sha256sums=('22dcaa8c172da1cd9a1c817ea1fe7d478a14074348b2ce0625c527b98bd430b4')

package() {
  find . -type f -name "*.ttf" -exec \
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" {} \;
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
