# Maintainer: Ľubomír 'The_K' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=3.12
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('MIT')
depends=('python-setuptools')
source=("https://github.com/bemeurer/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('d42f181cf32be18d2b9b3d3acd9c910d6644a84900159b891a909276234d7d51')

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
