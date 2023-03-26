# Maintainer: Fabio Manganiello <fabio@manganiello.tech>

pkgname=python-marshmallow-dataclass
pkgver=8.5.12
pkgrel=1
pkgdesc="Automatic generation of marshmallow schemas from dataclasses."
arch=('any')
license=('MIT')
url="https://github.com/lovasoa/marshmallow_dataclass"
depends=('python' 'python-marshmallow' 'python-typing_extensions' 'python-typing_inspect')
options=(!strip)
source=("v${pkgver}.tar.gz::https://github.com/lovasoa/marshmallow_dataclass/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('c31e6d7f58e32052620a5cff45532860a11ea8839681b1daba96588f7908998e9663ff3d29d0c318328148ad0bea5e0fa42c380ecb35c05d071b7e7dbc511485')

package() {
    cd "${srcdir}/marshmallow_dataclass-${pkgver}"
    python3 setup.py build install --root="${pkgdir}/" --optimize=1
}

