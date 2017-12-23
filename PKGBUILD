# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-pandas-docs
pkgver=0.21.1
pkgrel=1
pkgdesc="Documentation for Python Pandas module."
makedepends=('unzip')
arch=('any')
url='http://pandas.pydata.org'
license=('BSD')
source=("$pkgname-$pkgver.zip::http://pandas.pydata.org/pandas-docs/stable/pandas.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('77f7ebd4ce49608315830ab84583fea0b5b37c4eb6512e05b18786bbeea41052')

package()
{
  install -d "$pkgdir/usr/share/doc/python-pandas"
  unzip -qd "$pkgdir/usr/share/doc/python-pandas" "$srcdir/$pkgname-$pkgver.zip"
  find "$pkgdir/usr/share/doc/python-pandas/html" -type d -exec chmod 755 \{\} \;
  find "$pkgdir/usr/share/doc/python-pandas/html" -type f -exec chmod 644 \{\} \;
}
# vim:set ts=2 sw=2 et:
