# Maintainer: avionix <avionix at gmx dot com>

pkgname=ttf-astacid-mono
_commit='a0b612b9b58690463484f48c57dc83ef0c7e1aa1'
pkgver=1
pkgrel=1
pkgdesc='A DejaVu Sans Mono-based font for programming, patched with Nerd Fonts'
arch=('any')
url='https://github.com/avionix-g/astacid'
license=('custom:MIT')
source=("AstacidMono-${pkgver}.ttf::https://github.com/avionix-g/astacid/raw/${_commit}/AstacidMono.ttf"
        "${pkgname}-${pkgver}-MIT.txt::https://github.com/avionix-g/astacid/raw/${_commit}/LICENSE")
sha256sums=('e4b60e69be01f1ba1675a1905b8cb80465e711456bcc55d599f26a03813ac354'
            '71fa24f9a7f342f5c3e81ec33f943f87c633b3533f3c0a3b1218b0fb5e142475')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 AstacidMono-${pkgver}.ttf "${pkgdir}/usr/share/fonts/TTF/AstacidMono.ttf"
  install -Dm644 ${pkgname}-${pkgver}-MIT.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

