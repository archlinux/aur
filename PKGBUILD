# Maintainer: Shane <lyx_shane@outlook.com>
pkgname=xmind-zen
pkgver=2019
pkgrel=06
pkgdesc="xmind zen converted from .rpm package"
arch=("x86_64")
url="https://www.xmind.cn/"
license=('custom')
depends=()

source=(
	"http://dl2.xmind.cn/XMind-ZEN-for-Linux-64bit.rpm"
	"https://www.xmind.cn/terms/index.html"
)

md5sums=('fe6357e885b72400a597416ac3d0f314'
	 'SKIP')

options=('!strip')

package() {
  cd ${srcdir}
  cp -r opt usr ${pkgdir}
  install -Dm644 index.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}