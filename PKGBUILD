# Maintainer: Ruslan Bekenev <furyinbox at gmail dot com>
pkgname=todoist-electron
_pkgname=Todoist
pkgver=1.23.0
rlsver=1.23.0
pkgrel=4
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
sha256sums=('316F69F76711EE91104E5B219E0673467C74D00EC96AEBDB0932AAD4A61098CA')

package() {
	# copy binaries to fakeroot
	cp -r opt usr ${pkgdir}
}
