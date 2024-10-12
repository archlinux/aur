# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Twor <i@twor.me>
# Contributor: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Vova-K <v1mkss.m@gmail.com>
pkgname=xmcl-launcher
pkgver=0.47.4
pkgrel=1
pkgdesc="X Minecraft Launcher - A modern Minecraft launcher"
arch=('x86_64' 'aarch64')
provide=("xmcl")
url="https://xmcl.vercel.app/"
license=('MIT')
conflicts=('xmcl-launcher-bin')
optdepends=('jre8-openjdk: Minimum requirement for launching older game versions'
'jre11-openjdk: Recommended Java version for launching versions 1.12-1.17'
'jre17-openjdk: Recommended Java version for launching version 1.17 and above'
'jre22-openjdk: Recommended Java version for launching version 1.20.5+ and above')

source_x86_64=( "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-amd64.deb")

source_aarch64=("https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-arm64.deb")

sha256sums_x86_64=("99983834bebc8fa9464938e56497b49985f72c32d115d5cbec3e35dd89950b04")
sha256sums_aarch64=("31557521e74398f08a3266f18ac8c8895d73e04d4acc204cd862dede0decb861")

package(){
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  install -dv "${pkgdir}/usr/bin"
}
