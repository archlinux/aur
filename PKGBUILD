# Maintainer: Chris Morris <chris at lexforged dot com>
pkgname=ttf-unifontex-mono
pkgver=1.0
pkgrel=2
pkgdesc="An extended fork of GNU Unifont with a focus on high compatibility."
arch=(any)
url="https://github.com/stgiga/UnifontEX"
license=("GPL-2.0-with-font-exception, OFL-1.1")
source=("${pkgname}-${pkgver}.ttf::https://github.com/stgiga/UnifontEX/raw/hasMobileconfig/UnifontExMono.ttf"
        "${pkgname}-${pkgver}-LICENSE::https://unifoundry.com/LICENSE.txt")
sha512sums=("d227b9bda8d1d2385e55b1ee940cb4ce8572bf797724cc63c946e669518b3bd19cc213251448f76dde8af32e59579ca8f4b5764129542d5698214f3af570d29b"
            "f0a97c6f16ab1b6bb50e596b7c8c66648bfa1b701e639bc4d858e0b125d9da6e2bc6cbb247d3ca91f5b911148412275054d828fae0a29abd6a5a90eb721b72d2")

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 ${pkgname}-${pkgver}.ttf "$pkgdir/usr/share/fonts/TTF/UnifontExMono.ttf"
  install -Dm644 ${pkgname}-${pkgver}-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
