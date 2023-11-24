# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=mirrord-bin
pkgver=3.75.3
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
sha256sums=('e5e56491c23b27cc64eeeba59387da40b6e6dab6a5de87485783bfbd4b647876')

package() {
    mv "mirrord_${pkgver}" mirrord
    install -m 755 -D -t "${pkgdir}/usr/bin/" mirrord
    rm -f mirrord
}

