# Maintainer: Mike Sampson <mike at sambodata dot com>

pkgname=python-ptt
pkgver=1.10.0
pkgrel=1
pkgdesc="Includes a Twitter API, command-line tool, and IRC bot."
arch=(any)
url="http://mike.verdone.ca/twitter/"
source=("http://pypi.python.org/packages/source/t/twitter/twitter-$pkgver.tar.gz" 
        "LICENSE")
md5sums=('30d6de298affb11dcf56f96db3d9b36a'
         'a5da3e25967f8405eb578fa3ab7f4098')
license=('MIT')
depends=('python2' 'python2-distribute')
optdepends=('python-irclib: ircbot support')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=

build() {
    cd $srcdir/twitter-$pkgver
    python2 setup.py install --root=$pkgdir/ --optimize=1

    install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

