# Maintainer: gryffyn <aur@evan.mp>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=3.7.6
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
depends=('python' 'python-requests')
source=("https://github.com/eternnoir/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ca8809b8a9185b9fd40bc1feaf6cb42ba6a86ce82e5b77d1480f6308ea3fca35')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
