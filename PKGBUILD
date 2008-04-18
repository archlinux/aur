# $Id$
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Maintainer: simo <simo@archlinux.org>

pkgname=django
pkgver=0.96.1
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('i686')
license=('BSD')
url="http://www.djangoproject.com"
depends=('setuptools')
source=(http://media.djangoproject.com/releases/0.96/Django-0.96.1.tar.gz)
md5sums=('10aa32e58969c4efeb00ef42ba192b17')

build() { 
  cd $startdir/src/Django-$pkgver
  python setup.py install --root=$startdir/pkg || return 1
}
