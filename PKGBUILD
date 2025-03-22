# Maintainer: Ayad Seghiri <seghiri.ayad@univ-khenchela.dz>
pkgname=python-tornet
pkgver=2.2.0
pkgdesc="TorNet is a Python package that automates IP address changes using Tor. It is a top tool for securing your networks by frequently changing your IP address, making it difficult for trackers to pinpoint your location."
pkgrel=1
arch=('any')
url="https://github.com/ayadseghairi/tornet"
license=('MIT')
depends=('python')
source=("https://github.com/ayadseghairi/tornet/releases/download/2.2.0/python_tornet-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/python_tornet-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/python_tornet-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
