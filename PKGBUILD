pkgname=gnome-shell-extension-tray-icons
pkgver=6
pkgrel=1
pkgdesc="Simple version of TopIcons Plus"
arch=('any')
url="https://github.com/nicovell3/gnome-shell-extension-tray-icons"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f2fb870b3c4487449cf5befffeb94d6ea23a592986ec9aaee37060a568a570c5')

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com"
	install -Dm644 extension.js "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com/extension.js"
	install -Dm644 metadata.json "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com/metadata.json"
}
