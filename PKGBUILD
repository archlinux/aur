# Maintainer: Cam Webb <cw@camwebb.info>

pkgname=slacka
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight CLI client for Slack, in Gawk"
arch=('any')
url="https://github.com/camwebb/slacka"
license=('Unlicense')
depends=('gawk' 'gawk-json' 'curl')
source=("$pkgname-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('2eee7b3a99c4344d07c8a470aedada0f')

package() {

    install -Dm755 ${srcdir}/$pkgname-$pkgver/slacka  ${pkgdir}/usr/bin/slacka
    install -Dm644 ${srcdir}/$pkgname-$pkgver/UNLICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${srcdir}/$pkgname-$pkgver/config.json ${pkgdir}/usr/share/${pkgname}/config.json

}
