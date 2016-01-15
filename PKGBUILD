# Maintainer: Chad Aeschliman <chadaeschliman at gmail dot com>
# Contributor: Wael Nasreddine <gandalf at siemens-mobiles dot org>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=python-bibtex
pkgver=1.2.5
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="A Python extension to parse BibTeX files."
depends=('recode-pybliographer' 'glib2' 'python2')
url="http://www.pybliographer.org"
source=(http://downloads.sourceforge.net/pybliographer/$pkgname-$pkgver.tar.gz)
md5sums=('f65081935c731b916b0aeb10aeea45ff')

package() {
  cd $startdir/src/$pkgname-$pkgver

  python2 setup.py build || return 1
  python2 setup.py install --prefix=$pkgdir/usr
}
