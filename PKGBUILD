# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli-bin
pkgrel=7
pkgver=5.8.3
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('AGPL3')
provides=('symfony-cli')
conflicts=('symfony-cli')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/symfony-cli/symfony-cli/releases/download/v${pkgver}/symfony-cli_linux_amd64.tar.gz"
)
sha256sums=('60c004c30f2c6901ae9a5e509e4110c208ae75071e3c5a57c8419cdc4e102256')

package() {
    install -D -m 755 "${srcdir}/symfony" "${pkgdir}/usr/bin/symfony"
}
