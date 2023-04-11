# Maintainer: Bobby Rong <admin at bobby285271 dot top>
pkgname=ppet-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="在你的桌面放一个萌妹子，多一点趣味。"
arch=("x86_64")
url="https://github.com/zenghongtu/PPet"
license=('MIT')
depends=('electron')
conflicts=('ppet')
source=("https://github.com/zenghongtu/PPet/releases/download/v${pkgver}/PPet3-${pkgver}.deb")
md5sums=('4ccfdff2018c623ee6454ba222024422')

package() {
  install -d "${pkgdir}/usr/bin"
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  ln -s /opt/PPet/ppet "${pkgdir}"/usr/bin/ppet
}

