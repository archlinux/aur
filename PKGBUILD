# Maintainer: Antti <antti@antti.codes>

pkgname=questpatcher-bin
pkgver=2.10.0
pkgrel=2
pkgdesc="Generic il2cpp modding tool for Oculus Quest (1/2/3) apps."
arch=('x86_64')
url="https://github.com/Lauriethefish/QuestPatcher"
license=('Zlib')
options=('!strip')

source=(
  "questpatcher.desktop"
  "icon.png"
  "https://github.com/Lauriethefish/QuestPatcher/releases/download/$pkgver/QuestPatcher-ubuntu.zip"
)

sha512sums=('effcc4e7a5926cfb3093462ba443c7bbc34796d670993d52a1530678741902af411b73987ce98dc06e7c5cade601da7c0fa9d22c517099d50abbc2d7ca3ac126'
            'ca9f7d2e5fc31cd9db428ee3f0e901351a384c67b73f54cf7bfdad9f3cb307915b868260adcdb153388e834988dc0856ecf85016d97baf7700044215092d3bcf'
            '53cfbcc811f782cd28d47e5cf233600b7a3acb219a87a4e987582f4e27f47a58051a3cdaffbf48639ce617e02c71d095e8fbbff0c8b120f96a3b804ccc2e3828')

package() {
  install -Dm644 "${srcdir}/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/questpatcher.png"
  install -Dm644 "${srcdir}/questpatcher.desktop" "${pkgdir}/usr/share/applications/questpatcher.desktop"
  install -Dm755 "${srcdir}/QuestPatcher" "${pkgdir}/usr/bin/questpatcher"
}
