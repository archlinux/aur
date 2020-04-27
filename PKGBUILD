# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-erlang
pkgver=1.8.0
pkgrel=1
pkgdesc="Erlang Binary Term Format for Python"
arch=('any')
url="https://github.com/okeuday/erlang_py"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://github.com/okeuday/erlang_py/archive/v${pkgver}.tar.gz")
sha384sums=('8227c9b9cee6ab95fedb46add279cad3ffa39b239da85cc0d9a8b471d48b64a9e699c8cabb9edbc36bd62f154cb0df29')

package() {
    cd "$srcdir/erlang_py-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
