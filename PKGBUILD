# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=5
pkgver=5.0.8
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('AGPL3')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/symfony-cli/symfony-cli/releases/download/v${pkgver}/symfony-cli_linux_amd64.tar.gz"
)
sha256sums=('6f0523d728be903580cbc3d9cf02ab96d4b59900ad88f3c7228c5c8ea1c81245')

package() {
    install -D -m 755 "${srcdir}/symfony" "${pkgdir}/usr/bin/symfony"
}
