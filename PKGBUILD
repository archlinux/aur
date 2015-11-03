# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=tvcmd
pkgver=1.2.0
pkgrel=1
pkgdesc="Command line tool to keep track of tv shows episodes"
arch=('any')
url="http://tvcmd.horlux.org"
license="GPL3"
depends=('python' 'python-httplib2' 'python-xdg')
source=("https://github.com/juantascon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0cdee35f0f02d72be612253c452ad4a91d59c646ded65a231fefc0fbf43fc80e')

package() {
    cd $srcdir/$pkgname-$pkgver/
    python setup.py install --root $pkgdir
}
