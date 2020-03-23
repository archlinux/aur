# Maintainer: Bobby Rong <admin at bobby285271 dot top>
pkgname=ppet-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="在你的桌面放一个萌妹子，多一点趣味。"
arch=("x86_64")
url="https://github.com/zenghongtu/PPet"
license=('MIT')
depends=('electron')
conflicts=('ppet')
source=("https://ppet-bin.oss-cn-shenzhen.aliyuncs.com/PPet-${pkgver}.deb")
md5sums=('b71171c0102a36130ca64b9cfc35a586')

package() {
  install -d "${pkgdir}/usr/bin"
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
  ln -s /opt/PPet/ppet "${pkgdir}"/usr/bin/ppet
}

