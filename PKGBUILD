# Maintainer: Antti <antti@antti.codes>

pkgname=questpatcher-bin
pkgver=2.8.0
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
            '5cd966463f0593e9426558a93b502b4b27fc8d229bfe09b36aa18faae723dbfec620253e2f67baffbcfbcdd3f179fb346405285356312d66f6d3c835db35909d')

package() {
  install -Dm644 "${srcdir}/questpatcher.desktop" "${pkgdir}/usr/share/applications/questpatcher.desktop"
  install -Dm755 "${srcdir}/QuestPatcher" "${pkgdir}/usr/bin/questpatcher"
}
