# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=tvcmd
pkgver=1.2.1
pkgrel=1
pkgdesc="Command line tool to keep track of tv shows episodes"
arch=('any')
url="http://tvcmd.horlux.org"
license=("GPL3")
depends=('python' 'python-httplib2' 'python-xdg')
source=("https://github.com/juantascon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('aff8e1bad414dd73068b07f846d32e1206a2575da8e2df68111183e741ea7e2c')

package() {
    cd $srcdir/$pkgname-$pkgver/
    python setup.py install --root $pkgdir
}
