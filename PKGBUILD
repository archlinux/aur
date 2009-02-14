# $Id: PKGBUILD,v 1.2 2008/11/04 11:13:21 BaSh Exp $
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-nose
pkgver=0.10.4
pkgrel=2
pkgdesc="A discovery-based unittest extension."
arch=('i686' 'x86_64')
url="http://www.somethingaboutorange.com/mrl/projects/nose/"
license=('GPL2')
depends=('python')
makedepends=('setuptools')
source=(http://www.somethingaboutorange.com/mrl/projects/nose/nose-${pkgver}.tar.gz)

build() {
    cd "$srcdir/nose-$pkgver"
    python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
