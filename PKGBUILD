# $Id$
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=0.96.2
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.djangoproject.com"
depends=('setuptools')
source=(http://media.djangoproject.com/releases/0.96/Django-0.96.2.tar.gz)
md5sums=('2e39a43b93b50c2ca90bcade26010878')

build() {
    cd $startdir/src/Django-$pkgver
    python setup.py install --root=$startdir/pkg || return 1
    install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
