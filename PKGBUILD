# Maintainer: Marcin Wieczorek <marcin@marcin.co>
pkgname=minecraft-shiginima
pkgver=3.100
pkgrel=1
pkgdesc="ShiginimaSE Launcher - Sponge Edition"
url="http://teamshiginima.com/"
arch=('x86_64' 'i686')
license=('Custom')
depends=('java-runtime')
source=("http://kosz.marcin.co/ShiginimaSE_v3100.zip" "icon.png" "shiginima.desktop")
md5sums=('ea134738ddd5cfde81e5529968f082e1'
         '02fafe5e4429ca7aecac5610026f0f86'
         '2b6ce6a7ebd3a9a372089d73dd93a33e')

package() {
  cd $srcdir

  cp "ShiginimaSE_v3100/OS X and Linux/Shiginima Launcher SE v3.100.jar" "shiginima.jar"

  mkdir -p "${pkgdir}/opt/shiginima/"

  install -D -m644 "shiginima.jar" "${pkgdir}/opt/shiginima/"
  install -D -m644 "shiginima.desktop" "${pkgdir}/usr/share/applications/shiginima.desktop"
  install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/shiginima.png"
}
