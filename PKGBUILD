# Maintainer: Hurstel Alexandre <a.hurstel at unistra dot fr>
_pkgname=NordVPN-Connect
pkgname=gnome-shell-extension-nordvpn-connect-git
pkgver=r143.b009a83
pkgrel=1
pkgdesc="Unofficial Gnome-Shell Extension to provide a GUI for the official NordVPN CLI Tool."
arch=('any')
url="https://github.com/AlexPoilrouge/NordVPN-connect"
license=('GPL3')
depends=('gnome-shell>=3.34' 'nordvpn-bin>=3.3' 'systemd')
makedepends=('git')
install=gnome-shell-extension-nordvpn-connect-git.install
source=(
        "git://github.com/AlexPoilrouge/NordVPN-connect.git"
)

package() {
	cd NordVPN-connect
	
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
	./setup.sh --no-extension-mode --gitless --directory "$pkgdir/usr/share/gnome-shell/extensions/"
}

md5sums=('SKIP')

