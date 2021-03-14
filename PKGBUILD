# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jax
pkgver=0.2.10
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
source=("https://files.pythonhosted.org/packages/88/9d/2862825b5eddd0df64c78b22cc0b897f0128b1c6494bf39e4849e9e0fade/jax-0.2.10.tar.gz"
        "https://files.pythonhosted.org/packages/d2/bb/c8263c2b0a6d95fa4e093ee59a34b6ff50a7d346898dcb25ad62905ada1d/jaxlib-0.1.62-cp39-none-manylinux2010_x86_64.whl")
md5sums=('324f4ac60ae9c2e55685c13819d7c5ff'
         'a65f8580fbae1b645ab059d1488fa48c')

package() {
    pip install \
        --ignore-requires-python \
        --root=$pkgdir \
        "$srcdir/jax-${pkgver}.tar.gz" \
        "$srcdir/jaxlib-0.1.62-cp39-none-manylinux2010_x86_64.whl"
}
