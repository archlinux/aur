# Maintainer: Arkylin <x@xyz.blue>
# Maintainer: plokid <wan_shiwen@outlook.com>
# Contributer: sinux <Unknown>

pkgname=aur-accelerate-cn
pkgver=1.1
pkgrel=2
pkgdesc='来自知乎sinux的文章：机智的解决arch/manjaro安装AUR软件时github下载软件包慢或不可获得的问题'
url="https://zhuanlan.zhihu.com/p/176987140"
arch=('any')
license=('unknown')
depends=('aria2')
install="$pkgname.install"
source=('start.sh')
sha256sums=('4b9e9765dc1f9dc654baf638d245908b62d86cc9f096f70ffe67edbe921852be')

package() { 
  install -Dm755 ${srcdir}/start.sh ${pkgdir}/opt/${pkgname}/start.sh
}

