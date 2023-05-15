# Maintainer: Zhaose <zhaose233@outlook.com>
pkgname=xmcl-launcher-bin
_pkgname=xmcl-launcher
pkgver=0.34.1
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



sha256sums=('b98fe9f8cb9797961bce691da9a8d54d5f9236c0ebca9c2b61377d6f0f578259'
            '7292bbcf951bba1e34d265925c1ca5f786198a3b289a081e134e0e59b743e742'
            'e253e7e922f496ff6800b639ebc8cdbdc1c984b25d0598a0d175d07f0aa1dc67')

package(){
  cd ${pkgdir}
  install -Dm 644 ${srcdir}/app-${pkgver}-linux.asar ${pkgdir}/usr/lib/xmcl/xmcl.asar
  install -Dm 644 ${srcdir}/xmcl.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
  install -Dm 644 ${srcdir}/xmcl.desktop ${pkgdir}/usr/share/applications/xmcl.desktop
}
