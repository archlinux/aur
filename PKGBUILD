# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli-bin
pkgrel=7
pkgver=5.4.3
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('AGPL3')
provides=('symfony-cli')
conflicts=('symfony-cli')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/symfony-cli/symfony-cli/releases/download/v${pkgver}/symfony-cli_linux_amd64.tar.gz"
)
sha256sums=('d4d881cc53e8d31f715cf425709882bc69095dc694af12a8f675f849e2f4b258')

package() {
    install -D -m 755 "${srcdir}/symfony" "${pkgdir}/usr/bin/symfony"
}
