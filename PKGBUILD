# $Id: $
# Maintainer: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-nose
pkgver=0.11.0
pkgrel=1
pkgdesc="A discovery-based unittest extension."
arch=('i686' 'x86_64')
url="http://www.somethingaboutorange.com/mrl/projects/nose/"
license=('LGPL2')
depends=('python')
makedepends=('setuptools')
source=(http://www.somethingaboutorange.com/mrl/projects/nose/nose-${pkgver}.tar.gz)

build() {
  cd "$srcdir/nose-$pkgver"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
md5sums=('3f0f0c107fe9ae87771a3f4594b668ab')
