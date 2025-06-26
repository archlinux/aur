# Maintainer: pcmid <plzcmid at gmail dot com>

pkgname=ttf-jetbrains-maple-mono-xx-xx-ht
pkgver=1.2304.73
pkgrel=1
pkgdesc="JetBrains Maple Mono: The free and open-source font fused with JetBrains Mono & Maple Mono"
arch=(any)
url="https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono"
license=(OFL)
provides=(ttf-jetbrains-maple-mono)
conflicts=(ttf-jetbrains-maple-mono)
source=("JetBrainsMapleMono-XX-XX-HT-${pkgver}.zip::https://github.com/SpaceTimee/Fusion-JetBrainsMapleMono/releases/download/${pkgver}${pkgver_append}/JetBrainsMapleMono-XX-XX-HT.zip")
sha256sums=('ba8d0f5faf5fe5ff4eed1226141409f050909ba022b4826579da946c69b27bd3')

package() {
  find . -type f -name "*.ttf" -exec \
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" {} \;
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
