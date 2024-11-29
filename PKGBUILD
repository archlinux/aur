# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=mirrord-bin
pkgver=3.125.2
pkgrel=1
pkgdesc='Run your service in the context of your cloud environment.'
arch=('x86_64')
url='https://mirrord.dev/'
license=('MIT')
depends=()
makedepends=(
    'coreutils'
    'grep'
)
source=("mirrord_${pkgver}::https://github.com/metalbear-co/mirrord/releases/download/${pkgver}/mirrord_linux_x86_64")
sha256sums=('b381bf56474f7863bfbe1dfe8eecb48802ed9b043beda41f23be266dcf4f8a33')

package() {
    mv "mirrord_${pkgver}" mirrord
    install -m 755 -D -t "${pkgdir}/usr/bin/" mirrord
    rm -f mirrord
}

