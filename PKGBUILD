# Maintainer: Antti <antti@antti.codes>

pkgname=questpatcher-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Generic il2cpp modding tool for Oculus Quest (1/2/3) apps."
arch=('x86_64')
url="https://github.com/Lauriethefish/QuestPatcher"
license=('Zlib')
options=('!strip')

source=(
  "questpatcher.desktop"
  "https://github.com/Lauriethefish/QuestPatcher/releases/download/$pkgver/QuestPatcher-ubuntu.zip"
)

sha512sums=('7871b6cebca0a051999247375bf98c04d40069b8744f0bb0f2a300cbbe9ce55cf334d761571c338d0f32ad1a8437051181c6d364d6449cd3aa952e02a9f7ee7d'
            '53cfbcc811f782cd28d47e5cf233600b7a3acb219a87a4e987582f4e27f47a58051a3cdaffbf48639ce617e02c71d095e8fbbff0c8b120f96a3b804ccc2e3828')

package() {
  install -Dm644 "${srcdir}/questpatcher.desktop" "${pkgdir}/usr/share/applications/questpatcher.desktop"
  install -Dm755 "${srcdir}/QuestPatcher" "${pkgdir}/usr/bin/questpatcher"
}
