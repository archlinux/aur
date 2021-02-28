# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-status-area-horizontal-spacing
pkgver=2.6
pkgrel=1
pkgdesc="This is a GNOME shell extension that reduces the horizontal spacing between status area icons (top-right of the panel: volume indicator, etc)."
arch=('any')
url="https://gitlab.com/p91paul/status-area-horizontal-spacing-gnome-shell-extension"
license=('unknow')
depends=('gnome-shell')
source=('git+https://gitlab.com/p91paul/status-area-horizontal-spacing-gnome-shell-extension.git')
sha256sums=('SKIP')

package() {
	_uuid='status-area-horizontal-spacing@mathematical.coffee.gmail.com'

	cd status-area-horizontal-spacing-gnome-shell-extension
	make
	install -d "${pkgdir}/usr/share/gnome-shell/extensions"

	cp -af "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
