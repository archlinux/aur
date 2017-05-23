#Maintainer: ThomasWFan <thomas[at]moespirit[dot]ltd>
pkgname=memoink
pkgver=13.578.0
pkgrel=1
pkgdesc="A OneNote-like application with a nice GUI."
url="https://doui.cc/product/memoink"
arch=('x86_64')
license=('unknown')
depends=('gconf>=3.2.0')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='memoink.install'

source=("http://dl.cdn.doui.cc/apps/memoink-13.578-Linux.deb"
	"memoink_aur.desktop")

md5sums=('93a6ffe860c6e2634eab803737dd4e72'
	 '12b87b6002dae47227f2d60ecb772e18')

package() {
	cd "${srcdir}"
	mkdir ${pkgdir}/opt
	mkdir ${pkgdir}/opt/memoink
	install -D -m755 memoink_aur.desktop ${pkgdir}/opt/memoink/
	install -D -m755 memoink-13.578-Linux.deb ${pkgdir}/opt/memoink/
}
