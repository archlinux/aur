# Maintainer: Vova K <v1mkss.m@gmai.com>
pkgname=xmcl-minecraft
_pkgname=xmcl-minecraft
pkgver=0.44.9
pkgrel=2
pkgdesc="X Minecraft Launcher - Modern Minecraft Launcher"
arch=('x86_64' 'aarch64')
url="https://xmcl.vercel.app/"
license=('MIT')
provides=('xmcl-minecraft')

source_x86_64=(
    "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-amd64.deb"
    "xmcl.png"
)

source_aarch64=(
    "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-arm64.deb"
    "xmcl.png"
)

sha256sums_x86_64=(
    "faeb8ff117a2c4f0cb702a71a04d00cd9b2ae1bf68690f93dc3e63250f16e941"
    "7292bbcf951bba1e34d265925c1ca5f786198a3b289a081e134e0e59b743e742"
)
sha256sums_aarch64=(
    "c0d7990a3c7bab348d31d9c6318292b67878eb8e41e1af09c34b2d0d188940d4"
    "7292bbcf951bba1e34d265925c1ca5f786198a3b289a081e134e0e59b743e742"
)

package(){
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  install -dv "${pkgdir}/usr/bin"
  install -Dm 644 ${srcdir}/xmcl.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
}
