# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-setuptools-docs
pkgver=42.0.2
pkgrel=1
pkgdesc="Documentation for Python Setuptools module."
arch=('any')
url='https://github.com/pypa/setuptools'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://readthedocs.org/projects/setuptools/downloads/htmlzip/latest/")
sha256sums=('1df5702c866aea6e5b3932ac426ea172d01dfe50f488f270841b58d74f77be6a')

package()
{
  install -d "$pkgdir/usr/share/doc/python-setuptools"
  cp -a $srcdir/setuptools-latest/* "$pkgdir/usr/share/doc/python-setuptools"
}
# vim:set ts=2 sw=2 et:
