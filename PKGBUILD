# Maintainer: Lasha Kanteladze <kanteladzelasha339@gmail.com>
pkgname=dxhd-git
pkgver=20240bf
pkgrel=0
pkgdesc="An X11 Hotkey Daemon"
arch=('any')
url="https://github.com/dakyskye/dxhd"
depends=('util-linux')
makedepends=('make' 'git' 'go')
provides=('dxhd')
conflicts=('dxhd-bin')
source=("$pkgname::git+https://github.com/dakyskye/dxhd.git")
md5sums=('SKIP')

package() {
	cd "${pkgname}"
	make install
}
