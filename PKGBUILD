#Maintainer: Valentijn <contact at ev1l0rd dot info>
pkgname=tubeup
pkgver=0.0.12
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
url="https://github.com/bibanon/tubeup"
depends=('python' 'youtube-dl' 'python-jsonpatch' 'python-docopt' 'python-internetarchive')
makedepends=('python3' )
license=('GPL 3')
arch=('any')
source=('https://pypi.python.org/packages/7c/f2/be4e14cabaf74b165670b9aa2b6e86284014fda1ef1cffffcd675af6d3f7/tubeup-0.0.12.tar.gz')
md5sums=('7d5e30f777257fb1af8ff725f50abffa')

build() {
    cd $srcdir/tubeup-0.0.12
    python setup.py build
}

package() {
    cd $srcdir/tubeup-0.0.12
    python setup.py install --root="$pkgdir" --optimize=1 
}
