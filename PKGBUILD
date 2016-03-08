# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=1.4.2
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
depends=('python' 'python-requests')
source=("https://github.com/eternnoir/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7134e52667e58f0618b169e7b295bee8caab1d4342271f28091ecbbe78da4f9f')

package() {
    read
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
