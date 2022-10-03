# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.3.21
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
depends=('absl-py'
         'python'
         'python-jaxlib'
         'python-numpy'
         'python-opt_einsum')
makedepends=('python-pip')
source=("jax-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jax-v${pkgver}.tar.gz")
md5sums=('b6302ad0962be2c83415a779bddd18ae')

package() {
    cd $srcdir/jax-jax-v$pkgver
    python -m pip install \
        --root $pkgdir \
        --ignore-requires-python \
        .
}
