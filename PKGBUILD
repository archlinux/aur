# Maintainer: gryffyn <aur@evan.mp>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=3.7.2
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
depends=('python' 'python-requests')
source=("https://github.com/eternnoir/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d3658c7ca8cd4d8556033eda636fe92eedfac15b8319572c54a620cc52bb9c62')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
