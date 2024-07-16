# Maintainer: Fabio Manganiello <fabio@manganiello.tech>

pkgname=python-marshmallow-dataclass
pkgver=8.7.0
pkgrel=1
pkgdesc="Automatic generation of marshmallow schemas from dataclasses."
arch=('any')
license=('MIT')
url="https://github.com/lovasoa/marshmallow_dataclass"
depends=(
    'python'
    'python-marshmallow'
    'python-typeguard'
    'python-typing_extensions'
    'python-typing_inspect'
)
options=(!strip)
source=("v${pkgver}.tar.gz::https://github.com/lovasoa/marshmallow_dataclass/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('26bcbda06edb46d76a8508009d8b52c4cbef6f8c2128d56a724a0a6b760cefbb2630573fd5ce8db198d66ca1139a2789a702f94221dac57239e11dfd81ff2d59')

package() {
    cd "${srcdir}/marshmallow_dataclass-${pkgver}"
    python3 setup.py build install --root="${pkgdir}/" --optimize=1
}

