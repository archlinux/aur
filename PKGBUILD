# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-setuptools-docs
pkgver=34.3.3
pkgrel=1
pkgdesc="Documentation for Python Setuptools module."
arch=('any')
url='https://github.com/pypa/setuptools'
license=('MIT')
source=("$pkgname-$pkgver.zip::https://readthedocs.org/projects/setuptools/downloads/htmlzip/latest/")
sha256sums=('0d2155b681d8c3b38d49011a77ddd670478605b31a1e2b34caf8bd810ef7c341')

package()
{
  install -d "$pkgdir/usr/share/doc/python-setuptools"
  cp -a $srcdir/setuptools-latest/* "$pkgdir/usr/share/doc/python-setuptools"
}
