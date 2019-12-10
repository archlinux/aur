# Maintainer: robertfoster

pkgname=python-pa-ringbuffer
pkgver=0.1.3
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

sha256sums=('ab4bebceaac4278bca8116a9884d24f6c7714d5db57ddc3a61aad5a2a4407808')
