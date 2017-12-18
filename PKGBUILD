# Maintainer: chih <i at chih.me>

pkgname=wewechat
pkgver=1.1.5
pkgrel=2
pkgdesc='Unofficial WeChat client built with React, MobX and Electron.'
arch=('x86_64')
url='https://github.com/trazyn/weweChat'
license=('MIT')
_rpmname="wewechat-${pkgver}-linux-x86_64.rpm"
depends=('libappindicator-gtk2' 'gconf' 'libindicator-gtk2' 'libnotify' 'libxss' 'libxtst')
makedepends=()
options=()
source=("https://github.com/trazyn/weweChat/releases/download/v${pkgver}/${_rpmname}")
sha1sums=('0b5860e739c5233a2c5698344809313d78725a5a')

package() {
	cp -r ${srcdir}/opt ${pkgdir}/
	cp -r ${srcdir}/usr ${pkgdir}/
	mkdir -p ${pkgdir}/usr/bin/
	ln -s /opt/wewechat/wewechat ${pkgdir}/usr/bin/
}
