# Maintainer: chih <i at chih.me>

pkgname=wewechat
pkgver=1.1.5
pkgrel=0
pkgdesc='Unofficial WeChat client built with React, MobX and Electron.'
arch=('x86_64')
url='https://github.com/trazyn/weweChat'
license=('MIT')
_rpmname="wewechat-${pkgver}-linux-x86_64.rpm"
depends=('libxtst' 'gtk2' 'gconf' 'libxss' 'nss' 'python' 'alsa-lib' 'java-environment')
makedepends=()
options=()
source=("https://github.com/trazyn/weweChat/releases/download/v${pkgver}/${_rpmname}")
sha1sums=('0b5860e739c5233a2c5698344809313d78725a5a')

package() {
	cp -r ${srcdir}/opt ${pkgdir}/
	cp -r ${srcdir}/usr ${pkgdir}/
	mkdir -p ${pkgdir}/usr/bin/
	ln -s /opt/weweChat/wewechat ${pkgdir}/usr/bin/
}
