# Maintainer: Simon Weald <simon[at]simonweald[dot]com>
pkgname=python-ansigenome
_srcname=ansigenome
pkgver=0.6.0
pkgrel=1
pkgdesc="Ansigenome is a command line tool designed to help you manage your Ansible roles"
url="https://github.com/nickjj/ansigenome"
depends=('python2' 'python2-jinja' 'python2-yaml' 'python2-setuptools')
makedepends=('python2' 'python2-setuptools')
license=('GPLv3')
arch=('any')
source=('https://pypi.python.org/packages/68/82/f41ce20b98bd91e64ea49aee3660516c4d40f0a09ffa2c2932d4552c44c8/ansigenome-0.6.0.tar.gz')
sha256sums=('61efbb22ce180ba74c703992daf8cba8481b448a0c1851d1b6ac93ac49b68352')

build() {
    cd $srcdir/$_srcname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$_srcname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
