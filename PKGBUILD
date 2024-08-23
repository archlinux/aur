# Maintainer: Chris Morris <chris at lexforged dot com>
pkgname=ttf-unifontex-mono
pkgver=1.0
pkgrel=1
pkgdesc="An extended fork of GNU Unifont with a focus on high compatibility."
arch=(any)
url="https://github.com/stgiga/UnifontEX"
license=("GPL-2.0, OFLv1.1")
source=("${pkgname}-${pkgver}-${pkgrel}.ttf::https://github.com/stgiga/UnifontEX/raw/hasMobileconfig/UnifontExMono.ttf"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE::https://raw.githubusercontent.com/stgiga/UnifontEX/hasMobileconfig/LICENSE")
sha512sums=("d227b9bda8d1d2385e55b1ee940cb4ce8572bf797724cc63c946e669518b3bd19cc213251448f76dde8af32e59579ca8f4b5764129542d5698214f3af570d29b"
            "aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957")

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 ${pkgname}-${pkgver}-${pkgrel}.ttf "$pkgdir/usr/share/fonts/TTF/UnifontExMono.ttf"
  install -Dm644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
