# Maintainer: Ľubomír 'The_K' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=5.0.2
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('MIT')
depends=('python-setuptools')
source=("https://github.com/lovesegfault/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('afbb9758fff67c2fa5fe7d9a4a994145eec2520a88aabf85f3fc583289af3304')

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
