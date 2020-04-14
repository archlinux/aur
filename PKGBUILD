# Maintainer: gryffyn <aur@evan.mp>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=3.6.7
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
depends=('python' 'python-requests')
source=("https://github.com/eternnoir/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('47f0682bea216524814724db54c58fa6c17ea50db0b48f8b1e99807e72fdc468')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
