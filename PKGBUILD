# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: David McInnis <dave@dave3.xyz>
pkgname=python-scipy-docs
pkgver=1.7.1
pkgrel=1
pkgdesc="Documentation for Python SciPy module"
arch=('any')
url='http://docs.scipy.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::https://docs.scipy.org/doc/scipy-${pkgver}/scipy-html-${pkgver}.zip")
sha256sums=('744bfeb75df78eaf2d5de71d57e10649eb593e34b0dc47a21ef1209742b8be9f')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package()
{
	install -d "$pkgdir/usr/share/doc/python-scipy/html"
	cp -a ./* "${pkgdir}/usr/share/doc/python-scipy/html/"
}
# vim:set ts=4 sw=4:
