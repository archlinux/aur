# Maintainer: robertfoster

pkgname=python-pa-ringbuffer
pkgver=0.1.4
pkgrel=1
pkgdesc="Python wrapper for PortAudio's ring buffer"
arch=(any)
url="https://github.com/spatialaudio/python-pa-ringbuffer"
license=('MIT')
depends=('portaudio')
makedepends=('python-setuptools')
source=("https://github.com/spatialaudio/python-pa-ringbuffer/archive/$pkgver.tar.gz")

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --skip-build
}

sha256sums=('58d54698bf1b13490595671342225dd7cd264e820a7695abf4789ebdedd4d1c0')
