#Maintainer: Valentijn <deepnavy at waifu dot club>
pkgname=tubeup
pkgver=0.0.16
pkgrel=3
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
url="https://github.com/bibanon/tubeup"
depends=('python' 'youtube-dl' 'python-jsonpatch' 'python-docopt' 'python-internetarchive' 'python-backports.csv')
makedepends=('python3' )
license=('GPL 3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('facfab7e6ee9c35b18c1033ee9dfd266')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
