# Maintainer: Ľubomír 'The_K' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=5.0.0
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('MIT')
depends=('python-setuptools')
source=("https://github.com/lovesegfault/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('4eea96124fc77c4cf0bb0370e1971c328ddd5acc8f589e911f62d1cf8ed8e23b')

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
