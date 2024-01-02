# Maintainer: Zhaose <zhaose233@outlook.com>
pkgname=xmcl-launcher-bin
_pkgname=xmcl-launcher
pkgver=0.39.5
pkgrel=1
pkgdesc="X Minecraft Launcher - Modern Minecraft Launcher"
arch=('x86_64')
url="https://xmcl.app/"
license=('MIT')
depends=('electron')
optdepends=(
    'jre8-openjdk: For old versions of minecraft'
    'jre11-openjdk: Recommended for Minecraft 1.12(17w13a)-1.17(21w18a)'
    'jre17-openjdk: Recommended for Minecraft above 1.17(21w19a)'
)
source=(
    "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/app-${pkgver}-linux.asar"
    "xmcl.png"
    "xmcl.desktop"
)



sha256sums=('74e1367b0a1d10afac2a6cadee841cd0ae4d7f279d9b469f729fa7dee46fb59c'
            '7292bbcf951bba1e34d265925c1ca5f786198a3b289a081e134e0e59b743e742'
            '4e138d88cbecac4f380a17e0bb312472b94e8e65c273f5d7c508f5f4716b39fd')

package(){
  cd ${pkgdir}
  install -Dm 644 ${srcdir}/app-${pkgver}-linux.asar ${pkgdir}/usr/lib/xmcl/xmcl.asar
  install -Dm 644 ${srcdir}/xmcl.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
  install -Dm 644 ${srcdir}/xmcl.desktop ${pkgdir}/usr/share/applications/xmcl.desktop
}
