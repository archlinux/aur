# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jax
pkgver=0.1.68
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
depends=('absl-py'
         'python'
         'python-numpy'
         'python-opt_einsum'
         'python-protobuf'
         'python-scipy'
         'python-six')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/c8/61/28aa8cd45f5acf77137dd7fb475b72d9616f2eb4e3c2c9713d0449503223/jax-0.1.68.tar.gz"
        "https://files.pythonhosted.org/packages/02/21/562754b5d6c0f9e54cb95382f6c0e06f223958dd272d3e03a2704bfe8f46/jaxlib-0.1.47-cp38-none-manylinux2010_x86_64.whl")
md5sums=('3a55d2c3ba2e60841a1ac50166a01b0e'
         'dc94c916dc0f0cdfbc7bdeef2a0bdcf1')

package() {
    pip install \
        --ignore-requires-python \
        --root=$pkgdir \
        "$srcdir/jax-${pkgver}.tar.gz" \
        "$srcdir/jaxlib-0.1.47-cp38-none-manylinux2010_x86_64.whl"
}
