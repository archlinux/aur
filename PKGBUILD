# Maintainer: Heziode <Heziode@protonmail.com>

pkgname=emojify-pl
pkgver=1.3.0
pkgrel=1
pkgdesc='Emoji on the command line.'
arch=('any')
url='https://github.com/heziode/emojify'
depends=('perl')
conflicts=('emojify')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('0035b06e0e1bc6fd13eb24417a526976')

package() {
    install -Dm755 "${srcdir}/emojify-${pkgver}/emojify" "${pkgdir}/usr/bin/emojify"
    install -Dm644 "${srcdir}/emojify-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
