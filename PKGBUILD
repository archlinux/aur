# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-erlang
pkgver=1.7.9
pkgrel=1
pkgdesc="Erlang Binary Term Format for Python"
arch=('any')
url="https://github.com/okeuday/erlang_py"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://github.com/okeuday/erlang_py/archive/v${pkgver}.tar.gz")
sha384sums=('6ba135f3e41c8d46ca494d1b8321fa0fe1b72ee69a064663341076a2869ffea5cdb722f5114635541f9a986cd63bc72e')

package() {
    cd "$srcdir/erlang_py-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
