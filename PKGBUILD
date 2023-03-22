# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli-bin
pkgrel=7
pkgver=5.5.2
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('AGPL3')
provides=('symfony-cli')
conflicts=('symfony-cli')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/symfony-cli/symfony-cli/releases/download/v${pkgver}/symfony-cli_linux_amd64.tar.gz"
)
sha256sums=('ff2966767d14e8c23df9efa16ec13a0b509c30733f354cc1291a14bd3f7d9983')

package() {
    install -D -m 755 "${srcdir}/symfony" "${pkgdir}/usr/bin/symfony"
}
