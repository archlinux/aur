#Maintainer: Valentijn <deepnavy at waifu dot club>
pkgname=tubeup
pkgver=0.0.19
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
url="https://github.com/bibanon/tubeup"
depends=('python' 'youtube-dl' 'python-jsonpatch' 'python-docopt' 'python-internetarchive' 'python-backports.csv')
makedepends=('python3' )
license=('GPL 3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('567b4d971efbbe292b6a6ee166b25946')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
