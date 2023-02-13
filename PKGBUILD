# Maintainer: Arkylin <x@xyz.blue>
# Maintainer: plokid <wan_shiwen@outlook.com>
# Contributer: sinux <Unknown>

pkgname=aur-accelerate-cn
pkgver=1.1
pkgrel=1
pkgdesc='来自知乎sinux的文章：机智的解决arch/manjaro安装AUR软件时github下载软件包慢或不可获得的问题'
url="https://zhuanlan.zhihu.com/p/176987140"
arch=('any')
license=('unknown')
depends=('aria2')
install="$pkgname.install"
source=('start.sh')
sha256sums=('958f1a304bbe67020be6431be14d6995af3d33d92b15678fdc00a1ef7fb3dfbe')

package() { 
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp ${srcdir}/start.sh ${pkgdir}/opt/${pkgname}
}

