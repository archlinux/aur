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
md5sums=('2e656ea98f314482e1f9fdc1cbcb9633')

package() {
    install -Dm755 "${srcdir}/emojify-${pkgver}/emojify" "${pkgdir}/usr/bin/emojify"
    install -Dm644 "${srcdir}/emojify-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
