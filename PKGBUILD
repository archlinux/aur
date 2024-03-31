# Maintainer: Zhaose <zhaose233@outlook.com>
pkgname=xmcl-launcher-bin
_pkgname=xmcl-launcher
pkgver=0.43.0
pkgrel=1
pkgdesc="X Minecraft Launcher - Modern Minecraft Launcher"
arch=('x86_64')
url="https://xmcl.app/"
license=('MIT')
depends=('electron27')
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
sha256sums=('6720c410c2b32b71c5b3d30c4af38b61d2a8dd7db2c879d2f36e83b7c214ca11'
            '7292bbcf951bba1e34d265925c1ca5f786198a3b289a081e134e0e59b743e742'
            '7504507abe2efdd4e103c12efa028a093852d7c17e85377e1f07efe93fd52de2')

package(){
  cd ${pkgdir}
  install -Dm 644 ${srcdir}/app-${pkgver}-linux.asar ${pkgdir}/usr/lib/xmcl/xmcl.asar
  install -Dm 644 ${srcdir}/xmcl.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
  install -Dm 644 ${srcdir}/xmcl.desktop ${pkgdir}/usr/share/applications/xmcl.desktop
}
