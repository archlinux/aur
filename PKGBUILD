# Maintainer: super13 <fangguikai@163.com>
pkgname=listen1
pkgver=v1.2.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=('x86_64')
url="https://listen1.github.io/listen1/"
license=('MIT')
depends=()
source=("https://github.com/listen1/listen1_desktop/releases/download/v1.2.0/listen1_linux64_v120-amd64.deb")
md5sums=('a0dfbd4c3d04f6a4cc101495745da101')

package() {
	tar xJvf data.tar.xz -C "${pkgdir}";
}
