# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=gnome-shell-extension-tray-icons
pkgver=2
pkgrel=1
pkgdesc="Simple version of TopIcons Plus"
arch=('any')
url="https://github.com/zhangkaizhao/gnome-shell-extension-tray-icons"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('febe7da467de83b2ca30dd1e3261da7a16457ac2078442b9c4dd78d61f775f64')

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com"
	install -Dm644 extension.js "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com/extension.js"
	install -Dm644 metadata.json "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com/metadata.json"
}
