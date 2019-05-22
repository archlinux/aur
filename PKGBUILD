#Maintainer: Valentijn <contact at ev1l0rd dot info>
pkgname=tubeup
pkgver=0.0.16
pkgrel=2
pkgdesc="Youtube (and other video site) to Internet Archive Uploader"
url="https://github.com/bibanon/tubeup"
depends=('python' 'youtube-dl' 'python-jsonpatch' 'python-docopt' 'python-internetarchive' 'python-backports.csv')
makedepends=('python3' )
license=('GPL 3')
arch=('any')
source=('https://files.pythonhosted.org/packages/7f/f1/1fec4566c7a51f19269c40ca11bb5bfccac240fd0212517eaee9b6a17e59/tubeup-0.0.16.tar.gz')
md5sums=('facfab7e6ee9c35b18c1033ee9dfd266')

build() {
    cd $srcdir/tubeup-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/tubeup-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
