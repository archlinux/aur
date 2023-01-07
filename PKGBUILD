# Maintainer: TimeTrap <844177178@qq.com>
pkgname=xmcl-launcher
pkgver=0.33.1
pkgrel=1
pkgdesc="X Minecraft Launcher - 一个现代化的 Minecraft 启动器"
arch=('x86_64')
url="https://xmcl.app/"
license=('MIT')
optdepends=('jre8-openjdk: 启动低版本游戏的最低要求'
'jre11-openjdk: 推荐使用此版本Java启动1.12(17w13a)-1.17(21w18a)'
'jre17-openjdk: 推荐使用此Java版本启动1.17(21w19a)及以上的版本')
source=("https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-amd64.deb")
sha256sums=('5ed62fa373fec0787ecda33c2cb1458e7e5bfcdced02c075643bf015bfe5ee8d')

package(){
    cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
}
