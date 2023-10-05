# Maintainer: gryffyn <aur@evan.mp>
# Contributor: Helio Loureiro <helio@loureiro.eng.br>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=4.14.0
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPLv2")
depends=('python' 'python-requests' 'python-pytest' 'python-wheel' 'python-aiohttp')
source=("https://github.com/eternnoir/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('520b41e0d31505e83f766f411b748fd7a98beace6ee739317b35aa4fd9d32fe0')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
