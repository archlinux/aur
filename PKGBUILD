# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=5
pkgver=5.2.0
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('AGPL3')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/symfony-cli/symfony-cli/releases/download/v${pkgver}/symfony-cli_linux_amd64.tar.gz"
)
sha256sums=('8e4ac2ab6c161adbe0bcc9dcf77849c22dfbcd00d3730a38f4b0cdde9a435bcb')

package() {
    install -D -m 755 "${srcdir}/symfony" "${pkgdir}/usr/bin/symfony"
}
