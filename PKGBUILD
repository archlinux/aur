# Contributor: vsilv <vsilv@posteo.eu>
# Contributor: pancakes <aur@azz.am>

_ghname=python3-krakenex
pkgname=python-krakenex
pkgver=2.1.0
pkgrel=1
pkgdesc="Exchange API for Kraken.com"
arch=('any')
url="https://github.com/veox/python3-krakenex"
license=('LGPL')
makedepends=('python-setuptools')
source=("https://github.com/veox/$_ghname/archive/v$pkgver.tar.gz")
sha1sums=('de79e2b7b49cf370078374b116b389f313f3bc79')


package() {
    cd $_ghname-$pkgver
    cp LICENSE.txt LICENSE
    python setup.py install --root="$pkgdir/" --optimize=1

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

