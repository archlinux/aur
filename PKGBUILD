# Maintainer: juantascon <juantascon.aur@horlux.org>

pkgname=python-pytelegrambotapi
_pkgname=pyTelegramBotAPI
pkgver=2.0.0
pkgrel=1
pkgdesc="Python Telegram bot api"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
depends=('python' 'python-requests')
source=("https://github.com/eternnoir/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7ffa93f40914bb7bf2a140e48c50a7ad7dc59e865df6b9412825f717b92f3532')

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}/
    python setup.py install --root ${pkgdir}
}
