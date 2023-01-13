# Maintainer: gryffyn <aur@evan.mp>
# Contributor: Helio Loureiro <helio@loureiro.eng.br>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=4.8.0
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPLv2")
depends=('python' 'python-requests' 'python-pytest' 'python-wheel' 'python-aiohttp')
source=("https://github.com/eternnoir/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('59fa73c5c8b196523f9c293917979d99bb84e529f3ab42e87600dead1d73a809')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
