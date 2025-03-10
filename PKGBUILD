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
md5sums=('d2c6e5b5560bcc80add8c9729c60f353')

package() {
  find . -type f -name "*.ttf" -exec \
    install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" {} \;
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
