# Maintainer: XavierCLL

pkgname=python2-fmask
pkgver=0.3.0
pkgrel=1
pkgdesc="Implementation in Python of the cloud and shadow algorithms known collectively as Fmask"
arch=('any')
url="http://pythonfmask.org/"
license=('GPLv2')
depends=('python2' 'python2-rios')
source=("https://bitbucket.org/chchrsc/python-fmask/downloads/python-fmask-$pkgver.tar.gz")
sha256sums=('a16cf48111416f8d91dadb415b07778b075b49b0f78013b04ccac9c079995b22')

build() {
    cd python-fmask-$pkgver/
    python2 setup.py build
}

package() {
    cd python-fmask-$pkgver/
    python2 setup.py install --root="$pkgdir"
}
