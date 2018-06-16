# Maintainer: Philip Goto <philip.goto@gmail.com>

_pkgname=face_recognition_models
pkgname=python-$_pkgname
pkgver=latest
pkgrel=1
pkgdesc="Trained models for the face_recognition python library"
url="https://github.com/ageitgey/face_recognition_models"
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/ageitgey/face_recognition_models/archive/master.tar.gz")
sha256sums=('SKIP')

build(){
    cd $srcdir/$_pkgname-master
    python setup.py build
}

package(){
    cd $srcdir/$_pkgname-master
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
