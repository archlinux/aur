# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jax
pkgver=0.2.9
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
depends=('absl-py'
         'python'
         'python-flatbuffers'
         'python-numpy'
         'python-opt_einsum'
         'python-protobuf'
         'python-scipy'
         'python-six')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/6d/4b/cd013403adac3a7b3b6a616bf40abc7ba767fba63facdb260d2f09ba4e18/jax-0.2.9.tar.gz"
        "https://files.pythonhosted.org/packages/f4/4f/997245ba6cae047bce8d2a20fc9a6590360c3a5f6bf6269fa5126ad40a3f/jaxlib-0.1.59-cp39-none-manylinux2010_x86_64.whl")
md5sums=('7677bff64e0702173e984bb5fa317cac'
         'e2d518dcab7696f7aa2a135a28dc7dbc')

package() {
    pip install \
        --ignore-requires-python \
        --root=$pkgdir \
        "$srcdir/jax-${pkgver}.tar.gz" \
        "$srcdir/jaxlib-0.1.59-cp39-none-manylinux2010_x86_64.whl"
}
