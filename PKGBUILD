# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=3
pkgver=4.11.3
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('custom')
install="${pkgname}.install"
source=(
    "https://github.com/symfony/cli/releases/download/v${pkgver}/symfony_linux_amd64.gz"
    'eula.txt'
)
sha256sums=(
    'f89cc5c8b56ae44d8c1334f91cea9068d80a5c870b9c80a4e396dbab6b13de98'
    '46711d74e64aa4a26ae257063b795c432113b56fb80d1a69ffaa7b0b079dcf11'
)

package() {
    install -D -m 755 "${srcdir}/symfony_linux_amd64" "${pkgdir}/usr/bin/symfony"
    install -D -m 644 eula.txt "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
}
