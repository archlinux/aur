# Maintainer: Hurstel Alexandre <alexandre at hurstel dot eu>
_pkgname=NordVPN-Connect
pkgname=gnome-shell-extension-nordvpn-connect-git
pkgver=r194.a4cfe2c
pkgrel=2
pkgdesc="Unofficial Gnome-Shell Extension to provide a GUI for the official NordVPN CLI Tool."
arch=('any')
url="https://github.com/AlexPoilrouge/NordVPN-connect"
license=('GPL3')
depends=('gnome-shell>=3.36' 'nordvpn-bin>=3.6' 'systemd')
makedepends=('git')
install=gnome-shell-extension-nordvpn-connect-git.install
source=(
        "git+https://github.com/AlexPoilrouge/NordVPN-connect.git"
)

package() {
	cd NordVPN-connect
	
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
	./setup.sh --no-extension-mode --gitless --directory "$pkgdir/usr/share/gnome-shell/extensions/"
}

md5sums=('SKIP')

