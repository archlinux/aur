# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-setuptools-docs
pkgver=36.2.4
pkgrel=1
pkgdesc="Documentation for Python Setuptools module."
arch=('any')
url='https://github.com/pypa/setuptools'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://readthedocs.org/projects/setuptools/downloads/htmlzip/latest/")
sha256sums=('17d032d4a605ed80fd5107ef50d7424538a4b155d52d34bf52d8772a7e3e1d1d')

package()
{
  install -d "$pkgdir/usr/share/doc/python-setuptools"
  cp -a $srcdir/setuptools-latest/* "$pkgdir/usr/share/doc/python-setuptools"
}
