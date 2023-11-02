# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: David McInnis <dave@dave3.xyz>
pkgname=python-scipy-docs
pkgver=1.11.3
pkgrel=1
pkgdesc="Documentation for Python SciPy module"
arch=('any')
url='http://docs.scipy.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::https://docs.scipy.org/doc/scipy-${pkgver}/scipy-html-${pkgver}.zip")
sha256sums=('1ada7ab15a484a39dfe3b770249526fafe6ed897b770141c10d577125e060f30')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package()
{
	install -d "$pkgdir/usr/share/doc/python-scipy/html"
	cp -a ./* "${pkgdir}/usr/share/doc/python-scipy/html/"
}
# vim:set ts=4 sw=4 et:
