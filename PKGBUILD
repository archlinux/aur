# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=cum
pkgver=0.1
pkgrel=1
pkgdesc="Comic Updater, Mangafied"
arch=('any')
url="https://github.com/Hamuko/cum"
license=('Apache')
depends=('python-click' 'python' 'python-requests' 'python-sqlalchemy' 
         'python-beautifulsoup4' 'python-natsort')
source=("https://github.com/Hamuko/cum/archive/v${pkgver}.tar.gz")
options=(!emptydirs)
md5sums=('d782fb9c1e6334e39ecd798e2b97302f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
