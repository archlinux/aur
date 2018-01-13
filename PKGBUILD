#Maintainer: Valentijn <contact at ev1l0rd dot info>
pkgname=tubeup
pkgver=0.0.13
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
url="https://github.com/bibanon/tubeup"
depends=('python' 'youtube-dl' 'python-jsonpatch' 'python-docopt' 'python-internetarchive')
makedepends=('python3' )
license=('GPL 3')
arch=('any')
source=('https://pypi.python.org/packages/ce/44/fce9580418914980d41423a22e8f9da9f8e52e3d4ab6700eabe321874373/tubeup-0.0.13.tar.gz')
md5sums=('d640d3b7f18098acf2409eb836d437a1')

build() {
    cd $srcdir/tubeup-0.0.13
    python setup.py build
}

package() {
    cd $srcdir/tubeup-0.0.13
    python setup.py install --root="$pkgdir" --optimize=1 
}
