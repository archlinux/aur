# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-setuptools-docs
pkgver=38.2.4
pkgrel=1
pkgdesc="Documentation for Python Setuptools module."
arch=('any')
url='https://github.com/pypa/setuptools'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://readthedocs.org/projects/setuptools/downloads/htmlzip/latest/")
sha256sums=('cd4827caee9d64584ca434e1b67b44b6594028b38c00e140ebcab9c3d77ad66e')

package()
{
  install -d "$pkgdir/usr/share/doc/python-setuptools"
  cp -a $srcdir/setuptools-latest/* "$pkgdir/usr/share/doc/python-setuptools"
}
# vim:set ts=2 sw=2 et:
