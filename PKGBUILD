#Maintainer: Lucy <deepnavy at waifu dot club>
pkgname=tubeup
pkgver=0.0.27
pkgrel=1
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
url="https://pypi.org/project/tubeup"
depends=('python' 'youtube-dl' 'python-jsonpatch' 'python-docopt' 'python-internetarchive' 'python-backports.csv')
makedepends=('python3' )
license=('GPL 3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('533ab8241fc628c7c405aec96c79f634')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
