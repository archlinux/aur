pkgname=python-tornet
pkgver=2.1.1
pkgdesc="TorNet is a Python package that automates IP address changes using Tor. It is a top tool for securing your networks by frequently changing your IP address, making it difficult for trackers to pinpoint your location."
pkgrel=1
arch=('any')
url="https://github.com/ayadseghairi/tornet"
license=('MIT')
depends=('python')
source=("https://github.com/ayadseghairi/tornet/releases/download/2.1.1/tornet-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/tornet-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/tornet-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
