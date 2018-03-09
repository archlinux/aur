# Maintainer: Ľubomír 'The_K' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=3.8
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('GPL3')
depends=('python-setuptools')
source=("https://github.com/bemeurer/beautysh/archive/${pkgver}.tar.gz")
sha256sums=('54b40576d2bce2d5676e1196ef33e6f5f673ea2a0d0887703378807b8e626270')

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
