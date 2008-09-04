# $Id$
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=1.0
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.djangoproject.com"
depends=('setuptools')
source=(http://media.djangoproject.com/releases/1.0/Django-$pkgver.tar.gz)

md5sums=('84d0490e4126f31d1c23f640e1e86f2f')

build() {
    cd $startdir/src/Django-$pkgver
    python setup.py install --root=$startdir/pkg || return 1
    install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
