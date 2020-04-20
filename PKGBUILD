# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=gnome-shell-extension-tray-icons
pkgver=3
pkgrel=1
pkgdesc="Simple version of TopIcons Plus"
arch=('any')
url="https://github.com/zhangkaizhao/gnome-shell-extension-tray-icons"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('04207044b3f15cc402624495dc101f33ac7b8a73092d57d96bc7e47ecbec796d')

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com"
	install -Dm644 extension.js "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com/extension.js"
	install -Dm644 metadata.json "${pkgdir}/usr/share/gnome-shell/extensions/tray-icons@zhangkaizhao.com/metadata.json"
}
