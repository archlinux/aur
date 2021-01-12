# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jax
pkgver=0.2.7
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
source=("https://files.pythonhosted.org/packages/41/41/b19515466d55170892793c4738c808d4efc2d3a13ed863305d582c171e1e/jax-0.2.7.tar.gz"
        "https://files.pythonhosted.org/packages/9b/db/17a9472e72657d700772964b871dcb377be5ec4314eca00a90850ffffbe9/jaxlib-0.1.58-cp39-none-manylinux2010_x86_64.whl")
md5sums=('20efb0a973861f5c666cd5da3128c882'
         '9736139c5aeb1f8f10ae8e2a999660f2')

package() {
    pip install \
        --ignore-requires-python \
        --root=$pkgdir \
        "$srcdir/jax-${pkgver}.tar.gz" \
        "$srcdir/jaxlib-0.1.58-cp39-none-manylinux2010_x86_64.whl"
}
