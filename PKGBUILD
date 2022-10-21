pkgname=python-resize-right
pkgver=0.0.2
pkgrel=1
pkgdesc='The correct way to resize images or tensors. For Numpy or Pytorch (differentiable). '
arch=(x86_64)
url='https://github.com/assafshocher/ResizeRight'
license=('custom')
source=("$pkgname-$pkgver::https://files.pythonhosted.org/packages/f3/43/8d1bb734c6cd1c6424c8612d405f9bbfa87392751522d28b7daa3509c42b/resize-right-0.0.2.tar.gz")
sha512sums=('411745ea11a2a7cf31d1e458e8da5fc9abed6249818299467044c56cbe080ba9db8031ba4c61b0f7b8539f96e98fed80e52c624565def624f3d669bfc09528e3')
depends=(
    'python'
)

build() {
    cd resize-right-$pkgver
    python setup.py build
}

package() {
    cd resize-right-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
