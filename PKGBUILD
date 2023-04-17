#Maintainer: noirscape <deepnavy at waifu dot club>
pkgname=tubeup
pkgver=0.0.35
pkgrel=2
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
url="https://pypi.org/project/tubeup"
depends=('python' 'yt-dlp' 'python-jsonpatch' 'python-docopt' 'python-internetarchive' 'python-backports.csv')
makedepends=('python3' )
license=('GPL 3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b999e40e3960633e00399dc1dc242723')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
