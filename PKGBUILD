# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.3.24
pkgrel=4
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
md5sums=('5b2cc40d1c999733daddf35767acb8a5')

package() {
    cd $srcdir/jax-jax-v$pkgver
    pip --no-python-version-warning -v \
        install --ignore-installed --no-deps --root $pkgdir .
}
