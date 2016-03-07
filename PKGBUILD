# Maintainer: yaroslav <proninyaroslav@mail.ru>

pkgname=onioncircuits
pkgver=0.3
pkgrel=2
pkgdesc="GTK application to display Tor circuits and streams"
arch=('i686' 'x86_64')
url="https://git-tails.immerda.ch/onioncircuits"
license=('GPL3')
depends=('python>=3.4.2' 'python-gobject>=3.14.0' 'stem>=1.2.2' 'gobject-introspection' 'python-distutils-extra')
source=("http://http.debian.net/debian/pool/main/o/onioncircuits/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('4947c51f055d5cdab6cb15534e03e02acccd2f4ea8df9d23f00835e1381ed191')

build() {
    cd ${pkgname}-${pkgver}

    ./setup.py build
}
package() {
    cd ${pkgname}-${pkgver}

    ./setup.py install --root="${pkgdir}/"
}
