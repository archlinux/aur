# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=minecraft-shiginima
pkgver=4.400
pkgrel=1
pkgdesc="ShiginimaSE Launcher - Sponge Edition"
url="http://teamshiginima.com/"
arch=('x86_64' 'i686')
license=('Custom')
depends=('java-runtime>=8')
source=("https://teamshiginima.com/update/ShiginimaSE_v${pkgver/./}.zip"
        "icon.png"
        "shiginima.desktop")
sha256sums=('a62e5272a29a926bc236ec2fa4f06d28600006751247039eb18f50fe95038a22'
            '533355f33a37bbc03ed866fa497e9aabf0c25caa83f867e85e9eee63b7e323d3'
            'c5e24af649103f323862f6cf9dc4ab2ebb9a0380462323159e8ac7453a91c4b9')

package() {
  cd "${srcdir}"
  install -D -m644 "`find . -name "*.jar"`" "${pkgdir}/opt/shiginima/shiginima.jar"
  install -D -m644 "shiginima.desktop" "${pkgdir}/usr/share/applications/shiginima.desktop"
  install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/shiginima.png"
}
