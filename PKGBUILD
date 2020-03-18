# Maintainer: Bobby Rong <admin at bobby285271 dot top>
pkgname=ppet-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="在你的桌面放一个萌妹子，多一点趣味。"
arch=("x86_64")
url="https://github.com/zenghongtu/PPet"
license=('MIT')
depends=('electron')
conflicts=('ppet')
source=("https://bobby285271.oss-cn-shenzhen.aliyuncs.com/PPet-${pkgver}.deb")
md5sums=('c160c32e53446e9d17544e44a95991c9')

package() {
  install -d "${pkgdir}/usr/bin"
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  ln -s /opt/PPet/ppet "${pkgdir}"/usr/bin/ppet
}

