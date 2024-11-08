# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: David McInnis <dave@dave3.xyz>
pkgname=python-scipy-docs
pkgver=1.14.1
pkgrel=1
pkgdesc="Documentation for Python SciPy module"
arch=('any')
url='http://docs.scipy.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::https://docs.scipy.org/doc/scipy-${pkgver}/scipy-html-${pkgver}.zip")
sha256sums=('571f2c00885d0616437dcf09bc613d91f535e3092e1f5981ddc097e1437f8ea0')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package()
{
	install -d "$pkgdir/usr/share/doc/python-scipy/html"
	cp -a ./* "${pkgdir}/usr/share/doc/python-scipy/html/"
}
# vim:set ts=4 sw=4 et:
