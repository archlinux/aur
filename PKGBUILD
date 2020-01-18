# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname='beancount-cryptoassets'
pkgdesc='Price sources for Beancount that provide prices for various cryptoassets'
pkgver=1.4.0
pkgrel=1
arch=('any')
url="https://github.com/xuhcc/beancount-cryptoassets"
license=('GPL')
depends=('beancount')
source=("https://github.com/xuhcc/beancount-cryptoassets/archive/v${pkgver}.tar.gz")
sha256sums=('0627782ff69dfa4410a7201a4a0e9fc7fe59cee236065d4bb91c53886fa51ee3')

package () {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
}
