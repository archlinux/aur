# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=5
pkgver=5.1.0
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('AGPL3')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/symfony-cli/symfony-cli/releases/download/v${pkgver}/symfony-cli_linux_amd64.tar.gz"
)
sha256sums=('133792ae099e0e7784df8bbf9609fdc15da144b27ecfc5c862c476302b4411f8')

package() {
    install -D -m 755 "${srcdir}/symfony" "${pkgdir}/usr/bin/symfony"
}
