# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=local-php-security-checker
pkgrel=1
pkgver=1.0.0
pkgdesc="PHP security vulnerabilities checker."
url="https://github.com/fabpot/local-php-security-checker"
arch=('x86_64')
license=('GNU Affero General Public License v3.0')
source=(
    "$pkgname-$pkgver::https://github.com/fabpot/local-php-security-checker/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64"
)
sha256sums=('e5b12488ca78bc07c149e9352278bf10667b88a8461caac10154f9a6f5476369')

package() {
    install -D -m 755 "${srcdir}/$pkgname-$pkgver" "${pkgdir}/usr/bin/local-php-security-checker"
}
