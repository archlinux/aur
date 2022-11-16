# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.3.25
pkgrel=2
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
sha256sums=('49e8ce88ddd7dd0de86116c9d75d98a577a9061377ec423493fbac5ea29f79f0')

package() {
    cd $srcdir/jax-jax-v$pkgver
    pip --no-python-version-warning -v \
        install --ignore-installed --no-deps --root $pkgdir .
}
