# Maintainer: moetayuko <loli at yuko dot moe>

pkgname=fake-deepin-file-manager
pkgdesc="Workaround the Show in Folder functionality for wechat"
pkgver=1.0
pkgrel=2
arch=(any)
url="https://github.com/7Ji-PKGBUILDs/wechat-universal-bwrap"
license=(GPL-2.0-or-later)
depends=('dbus' 'xdg-utils')
provides=('deepin-file-manager')
conflicts=('deepin-file-manager')
source=('dde-file-manager')
sha256sums=('284106e9881175dd4e1aef93e4e18560ce272a2860364d4a62d20636c229a36a')

package() {
	install -Dm755 ${srcdir}/dde-file-manager ${pkgdir}/usr/bin/dde-file-manager
}
