# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=beautysh
pkgver=6.1.0
pkgrel=1
pkgdesc="A Bash beautifier for the masses"
arch=('any')
url='https://github.com/bemeurer/beautysh'
license=('MIT')
depends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('966b4acb877ad3606a96524e42c8368f0fdff30058340b497788ec4161b7d544')

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
