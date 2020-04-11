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
sha256sums=('45be513508eafc2402e4596fcaaeff14e6285df3912e50be10777352bdbb2591')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
