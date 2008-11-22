# $Id$
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=1.0.2
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.djangoproject.com"
depends=('setuptools')
source=(http://media.djangoproject.com/releases/$pkgver/Django-$pkgver-final.tar.gz)

build() {
    cd $startdir/src/Django-$pkgver-final
    python setup.py install --root=$startdir/pkg || return 1
    install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('89353e3749668778f1370d2e444f3adc')
