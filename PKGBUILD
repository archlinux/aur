# Maintainer: yesuu zhang <yesuu79@qq.com>

pkgname=xpybutil-git
pkgver=r89.8ee7dc4
pkgrel=1
pkgdesc='An incomplete xcb-util port plus some extras'
arch=('any')
url='https://github.com/BurntSushi/xpybutil'
license=('custom:WTFPL')
makedepends=('git')
depends=('python2' 'xpyb-git')
optdepends=('python-imaging')
source=('git+https://github.com/BurntSushi/xpybutil.git')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/xpybutil"
	python2 ./setup.py install --root=$pkgdir
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s -f /usr/share/doc/xpybutil/COPYING "${pkgdir}/usr/share/licenses/${pkgname}"
}
