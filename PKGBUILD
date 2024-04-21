# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: David McInnis <dave@dave3.xyz>
pkgname=python-scipy-docs
pkgver=1.13.0
pkgrel=1
pkgdesc="Documentation for Python SciPy module"
arch=('any')
url='http://docs.scipy.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::https://docs.scipy.org/doc/scipy-${pkgver}/scipy-html-${pkgver}.zip")
sha256sums=('704f4f22f3764b3d58f99c16b448a45f482c0d5667c12d28167a09291b74279f')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package()
{
	install -d "$pkgdir/usr/share/doc/python-scipy/html"
	cp -a ./* "${pkgdir}/usr/share/doc/python-scipy/html/"
}
# vim:set ts=4 sw=4 et:
