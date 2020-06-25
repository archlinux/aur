# Maintainer: Lasha Kanteladze <kanteladzelasha339@gmail.com>
pkgname=dxhd-bin
pkgver=25.06.2020_22.02
pkgrel=0
pkgdesc="An X11 Hotkey Daemon"
arch=('x86_64')
url="https://github.com/dakyskye/dxhd"
license=('MIT')
depends=('util-linux')
provides=('dxhd')
conflicts=('dxhd-git')
source=("https://github.com/dakyskye/dxhd/releases/download/$pkgver/dxhd")
md5sums=('SKIP')


package() {
	sudo install -Dt "/usr/bin/" "dxhd"
}
