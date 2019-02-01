# Maintainer: Sigoden Huang <sigoden@gmail.com>
pkgname=deepin-baidu-pan
pkgver=5.5.4deepin6
pkgrel=1
pkgdesc="Baidu net disk client on Deepin Wine"
arch=("x86_64")
url="http://www.deepin.com/"
license=('custom')
depends=('p7zip' 'deepin-wine' 'xorg-xwininfo' 'xdotool')
_mirror="https://mirrors.tuna.tsinghua.edu.cn/deepin"
source=("$_mirror/pool/non-free/d/deepin.com.baidu.pan/deepin.com.baidu.pan_${pkgver}.tar.xz")
sha1sums=('c84cca9b2fc428d961ae9974cbbfdb3582e804b4')

package() {
  cd ${srcdir}/deepin.com.baidu.pan-${pkgver}
  ar -xv deepin.com.baidu.pan_${pkgver}_i386.deb
  tar -xvf data.tar.xz -C ${pkgdir}
  chmod -x ${pkgdir}/usr/local/share/applications/deepin.com.baidu.pan.desktop
}
