# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=3.6.6
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
depends=('python' 'python-requests')
source=("https://github.com/eternnoir/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c49af4c9d56b34e15824b31650072f54e25a8c08072fef7a9fa17b3ef11fbf10')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
