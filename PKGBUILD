# Maintainer: Sigoden Huang <sigoden@gmail.com>
pkgname=deepin-wine-baidupan
pkgver=5.7.3deepin0
pkgrel=1
pkgdesc="Baidu net disk client on Deepin Wine"
arch=("x86_64")
url="http://www.deepin.com/"
license=('custom')
depends=('p7zip' 'deepin-wine' 'xorg-xwininfo' 'xdotool' 'wqy-microhei')
_mirror="https://mirrors.tuna.tsinghua.edu.cn/deepin"
source=("$_mirror/pool/non-free/d/deepin.com.baidu.pan/deepin.com.baidu.pan_${pkgver}_i386.deb")
sha1sums=('6fac6f2e01e394a909dd077c3dcc78892c4f114f')

package() {
  cd ${srcdir}
  tar -xvf data.tar.xz -C ${pkgdir}
}