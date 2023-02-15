# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli-bin
pkgrel=7
pkgver=5.5.0
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('AGPL3')
provides=('symfony-cli')
conflicts=('symfony-cli')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/symfony-cli/symfony-cli/releases/download/v${pkgver}/symfony-cli_linux_amd64.tar.gz"
)
sha256sums=('cd7cf45853368ac2587fb2b14f69837e43ee67124b4b2e03fa2303a3163faebc')

package() {
    install -D -m 755 "${srcdir}/symfony" "${pkgdir}/usr/bin/symfony"
}
