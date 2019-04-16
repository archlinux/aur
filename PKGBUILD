# Maintainer: Jingbei Li <i@jingbei.li>
# Maintainer: Levinit <levinit at outlook>
pkgname=deepin-baidu-pan
pkgver=5.7.3
pkgrel=1
pkgdesc="Deepin Wine Baidupan"
arch=('i686' 'x86_64')
url="http://pan.baidu.com/"
license=('custom')
#depends=('p7zip' 'wine' 'xorg-xwininfo' 'xdotool')
depends=('p7zip')
source=("https://mirrors.tuna.tsinghua.edu.cn/deepin/pool/non-free/d/deepin.com.baidu.pan/deepin.com.baidu.pan_5.7.3deepin0_i386.deb")
md5sums=('SKIP')

package() {
	tar -xvf data.tar.xz -C $pkgdir
}
