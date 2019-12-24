# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-setuptools-docs
pkgver=42.0.2
pkgrel=2
pkgdesc="Documentation for Python Setuptools module."
arch=('any')
url='https://github.com/pypa/setuptools'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://readthedocs.org/projects/setuptools/downloads/htmlzip/latest/")
sha256sums=('9d04322169a8fa5950d645baca801c7a3844b0b695fc0bab1dc26934e0a72739')

package()
{
  install -d "$pkgdir/usr/share/doc/python-setuptools"
  cp -a $srcdir/setuptools-latest/* "$pkgdir/usr/share/doc/python-setuptools"
}
# vim:set ts=2 sw=2 et:
