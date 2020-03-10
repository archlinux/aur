# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=6.0.1
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('MIT')
depends=('python-setuptools')
source=("https://github.com/lovesegfault/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('16830490343a9bdb30e0b9cc994dec735114cfd4ba7c69b4545ff7e287df48b3')

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
