# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-setuptools-docs
pkgver=42.0.2
pkgrel=3
pkgdesc="Documentation for Python Setuptools module."
arch=('any')
url='https://github.com/pypa/setuptools'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://readthedocs.org/projects/setuptools/downloads/htmlzip/latest/")
sha256sums=('SKIP')

package()
{
    install -d "$pkgdir/usr/share/doc/python-setuptools"
    cp -a $srcdir/setuptools-latest/* "$pkgdir/usr/share/doc/python-setuptools"
}
# vim:set ts=4 sw=4 et:
