# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=2.1.5
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
depends=('python' 'python-requests')
source=("https://github.com/eternnoir/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('21a66eb939db8f522902faeb22a7889e74e75250d5fa25e6047a982781dddd47')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
