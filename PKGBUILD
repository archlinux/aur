# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=3
pkgver=4.12.10
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('custom')
install="${pkgname}.install"
source=(
    "https://github.com/symfony/cli/releases/download/v${pkgver}/symfony_linux_amd64.gz"
    'eula.txt'
)
sha256sums=('e1d41d51d1c58638f605396121d83bfcfd19c87bcfbcd852f991690698b10b5a'
            '46711d74e64aa4a26ae257063b795c432113b56fb80d1a69ffaa7b0b079dcf11')

package() {
    install -D -m 755 "${srcdir}/symfony_linux_amd64" "${pkgdir}/usr/bin/symfony"
    install -D -m 644 eula.txt "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
}
