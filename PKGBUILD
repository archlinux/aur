# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: David McInnis <dave@dave3.xyz>
pkgname=python-scipy-docs
pkgver=1.9.3
pkgrel=1
pkgdesc="Documentation for Python SciPy module"
arch=('any')
url='http://docs.scipy.org'
license=('BSD')
source=("${pkgname}-${pkgver}.zip::https://docs.scipy.org/doc/scipy-${pkgver}/scipy-html-${pkgver}.zip")
sha256sums=('67fb23ddc83d3d733eb887ddb88f2e9dec53a3b60b76a21029507688ab99199f')

prepare() {
	rm ${pkgname}-${pkgver}.zip
}

package()
{
	install -d "$pkgdir/usr/share/doc/python-scipy/html"
	cp -a ./* "${pkgdir}/usr/share/doc/python-scipy/html/"
}
# vim:set ts=4 sw=4 et:
