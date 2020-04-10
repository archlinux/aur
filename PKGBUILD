# Maintainer: Ruslan Bekenev <furyinbox at gmail dot com>
pkgname=todoist-electron
_pkgname=Todoist
pkgver=1.21.0
rlsver=1.21
pkgrel=2
pkgdesc="Electron wrapper for todoist web client."
arch=('x86_64')
url="https://github.com/KryDos/todoist-linux"
license=('ISC')
provides=('todoist')
conflicts=('todoist')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${_pkgname}.install
source=("https://github.com/KryDos/todoist-linux/releases/download/$rlsver/$_pkgname-$pkgver.pacman")
sha256sums=('6e400c44eb20919ca52e1b58a14e9e53711879f7b269a57fe4bf6aecebcbd608')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}
}
