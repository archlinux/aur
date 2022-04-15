pkgname=gnome-shell-extension-tray-icons
pkgver=8
pkgrel=1
pkgdesc="Simple version of TopIcons Plus"
arch=('any')
url="https://github.com/nicovell3/gnome-shell-extension-tray-icons"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7900358d15d101ee6eeb8900d4dd323211c563aec716efcfd1b9cdd343fc4120')

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@nicovell3"
	install -Dm644 extension.js "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@nicovell3/extension.js"
	install -Dm644 metadata.json "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@nicovell3/metadata.json"
}
