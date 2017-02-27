# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=2.2.3
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
depends=('python' 'python-requests')
source=("https://github.com/eternnoir/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('db010ccae65b1b6aea9c9d5697cfbab96943c380907c7c7aab945ddd24f14098')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
