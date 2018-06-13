#Maintainer: Valentijn <contact at ev1l0rd dot info>
pkgname=tubeup
pkgver=0.0.14
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
url="https://github.com/bibanon/tubeup"
depends=('python' 'youtube-dl' 'python-jsonpatch' 'python-docopt' 'python-internetarchive')
makedepends=('python3' )
license=('GPL 3')
arch=('any')
source=('https://files.pythonhosted.org/packages/61/f3/39d17b880d2d7c7317f228f906c6ae808919d193c7808d2709270cd3d4e6/tubeup-0.0.14.tar.gz')
md5sums=('50198acb4c3ea140f875c97916d514de')

build() {
    cd $srcdir/tubeup-0.0.14
    python setup.py build
}

package() {
    cd $srcdir/tubeup-0.0.14
    python setup.py install --root="$pkgdir" --optimize=1 
}
