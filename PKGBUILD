# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=local-php-security-checker
pkgrel=1
pkgver=2.0.6
pkgdesc="PHP security vulnerabilities checker."
url="https://github.com/fabpot/local-php-security-checker"
arch=('x86_64')
license=('AGPL3')
source=(
    "$pkgname-$pkgver::https://github.com/fabpot/local-php-security-checker/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64"
)
sha256sums=('314309702970bd8f2eed68301c3c42012a938fb8ae5c977c4ab0db57bb69b23c')

package() {
    install -D -m 755 "${srcdir}/$pkgname-$pkgver" "${pkgdir}/usr/bin/local-php-security-checker"
}
