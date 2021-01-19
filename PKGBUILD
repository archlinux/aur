# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jax
pkgver=0.2.8
pkgrel=2
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
source=("https://files.pythonhosted.org/packages/a8/63/8afe8ffe33135b2cdbfaf8a58a265b9e697a8aac653063edccfee7c9b55a/jax-0.2.8.tar.gz"
        "https://files.pythonhosted.org/packages/f4/4f/997245ba6cae047bce8d2a20fc9a6590360c3a5f6bf6269fa5126ad40a3f/jaxlib-0.1.59-cp39-none-manylinux2010_x86_64.whl")
md5sums=('f0287647394cd8a3349c60c0ee37c0c7'
         'e2d518dcab7696f7aa2a135a28dc7dbc')

package() {
    pip install \
        --ignore-requires-python \
        --root=$pkgdir \
        "$srcdir/jax-${pkgver}.tar.gz" \
        "$srcdir/jaxlib-0.1.59-cp39-none-manylinux2010_x86_64.whl"
}
