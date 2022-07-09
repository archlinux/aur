# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=local-php-security-checker
pkgrel=1
pkgver=2.0.4
pkgdesc="PHP security vulnerabilities checker."
url="https://github.com/fabpot/local-php-security-checker"
arch=('x86_64')
license=('AGPL3')
source=(
    "$pkgname-$pkgver::https://github.com/fabpot/local-php-security-checker/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64"
)
sha256sums=('99ed3b0b47fab1d68fda276722ce40644bd90179d0f06c195c61d2d9443dbd7f')

package() {
    install -D -m 755 "${srcdir}/$pkgname-$pkgver" "${pkgdir}/usr/bin/local-php-security-checker"
}
