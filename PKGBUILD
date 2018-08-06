# Maintainer: chih <i at chih.me>

pkgname=wewechat
pkgver=1.1.7
pkgrel=1
pkgdesc='Unofficial WeChat client built with React, MobX and Electron.'
arch=('x86_64')
url='https://github.com/trazyn/weweChat'
license=('MIT')
_rpmname="wewechat-${pkgver}-linux-x86_64.rpm"
depends=('gconf' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst')
makedepends=()
options=()
source=("https://github.com/trazyn/weweChat/releases/download/v${pkgver}/${_rpmname}")
sha1sums=('e3f199164d49944ff09793055dae6bcec903a997')

package() {
	cp -r ${srcdir}/opt ${pkgdir}/
	cp -r ${srcdir}/usr ${pkgdir}/
	mkdir -p ${pkgdir}/usr/bin/
	ln -s /opt/wewechat/wewechat ${pkgdir}/usr/bin/
}
