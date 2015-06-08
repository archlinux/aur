# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>

pkgname=python-seqlearn-git
pkgver=20141124
pkgrel=1
pkgdesc="A sequence classification toolkit for Python."
arch=('i686' 'x86_64')
url="http://larsmans.github.io/seqlearn/"
license=('custom: Copyright 2013-2014 Lars Buitinck / University of Amsterdam and contributors')
groups=()
depends=('python' 'python-numpy>=1.6' 'python-scipy>=0.11' 'cython>=0.20.2')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(git://github.com/larsmans/seqlearn.git)
md5sums=("SKIP")

package() {
  cd "$srcdir/seqlearn"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
