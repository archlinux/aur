# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=tensorboardX
pkgname=python-tensorboardx
pkgver=1.9
pkgrel=1
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=('python-protobuf' 'python-six')
makedepends=('python-setuptools' 'git')
conflicts=('python-tensorboard-git')
source+=("git+https://github.com/lanpa/tensorboardX.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$_name"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}
