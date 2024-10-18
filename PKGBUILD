# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Twor <i@twor.me>
# Contributor: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: Vova-K <v1mkss.m@gmail.com>
pkgname=xmcl-launcher
pkgver=0.47.6
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

sha256sums_x86_64=("4091afae7a9216c05963ba428b7e906df0396dceacdc9fe4fcfc50703a4f8e25")
sha256sums_aarch64=("84d77001cbfdcfcbc651c75f546e97863dc08fb25974f7c2030edc82ab047dc0")

package(){
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  install -dv "${pkgdir}/usr/bin"
}
