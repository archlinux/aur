# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=local-php-security-checker
pkgrel=1
pkgver=2.0.5
pkgdesc="PHP security vulnerabilities checker."
url="https://github.com/fabpot/local-php-security-checker"
arch=('x86_64')
license=('AGPL3')
source=(
    "$pkgname-$pkgver::https://github.com/fabpot/local-php-security-checker/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64"
)
sha256sums=('f87eb8babe0e0d1cc82f8808bb103a8fdc7dbf6fb1b350a67abbf608313e29ce')

package() {
    install -D -m 755 "${srcdir}/$pkgname-$pkgver" "${pkgdir}/usr/bin/local-php-security-checker"
}
