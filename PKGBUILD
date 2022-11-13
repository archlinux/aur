pkgname=gnome-shell-extension-tray-icons
pkgver=9
pkgrel=1
pkgdesc="Simple version of TopIcons Plus"
arch=('any')
url="https://github.com/nicovell3/gnome-shell-extension-tray-icons"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('19cc1df507835201dda4ad70fa364f79760b3c5fde4e7d3ed1e1133920b2a40d')

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@nicovell3"
	install -Dm644 extension.js "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@nicovell3/extension.js"
	install -Dm644 metadata.json "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@nicovell3/metadata.json"
}
