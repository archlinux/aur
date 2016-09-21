# Maintainer: XavierCLL

pkgname=python2-fmask
pkgver=0.4.2
pkgrel=1
pkgdesc="Implementation in Python of the cloud and shadow algorithms known collectively as Fmask"
arch=('any')
url="http://pythonfmask.org/"
license=('GPLv2')
depends=('python2' 'python2-rios')
source=("https://bitbucket.org/chchrsc/python-fmask/downloads/python-fmask-$pkgver.tar.gz")
sha256sums=('2aba33c616920cec8dc6fd2fdac3aaab5a180a1e0ead892380c9b359e273cc02')

build() {
    cd python-fmask-$pkgver/
    python2 setup.py build
}

package() {
    cd python-fmask-$pkgver/
    python2 setup.py install --root="$pkgdir"
}
