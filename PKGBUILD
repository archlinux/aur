# Maintainer: yaminogame
pkgname=baidunetdisk
pkgver=2.0.1
pkgrel=1
pkgdesc="Baidubetdisk Client, converted from .rpm package"
arch=("x86_64")
url="http://pan.baidu.com/"
license=('custom')
depends=()
source=(
	"https://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/baidunetdisk_linux_${pkgver}.rpm"
)
md5sums=('134bea2832e8e74c1646eb09f375b008'
)

package() {
  cd ${srcdir}
  cp -r opt usr ${pkgdir}
}
