pkgname='python-facexlib'
pkgver=0.2.1.0
pkgrel=1
pkgdesc="FaceXlib aims at providing ready-to-use face-related functions based on current STOA open-source methods. "
arch=('x86_64')
url="https://github.com/xinntao/facexlib"
license=('MIT')
depends=('python-filterpy' 'python-numba' 'python-numpy' 'python-opencv' 'python-pillow'
'python-scipy' 'python-pytorch' 'python-torchvision' 'python-tqdm')
makedepends=('python-setuptools')

source=("https://github.com/xinntao/facexlib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('557886ad7465c501eadb98d77c1976ce69b1ccaa7a921db4115ebe3759747f74')

package() {
    cd facexlib-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
