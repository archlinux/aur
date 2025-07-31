# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=mirrord-bin
pkgver=3.154.0
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
sha256sums=('30b2d4540b263b0c93cd6c3f2abf5d538a3cf984276421bb22eda2cc4a95def5')

package() {
    mv "mirrord_${pkgver}" mirrord
    install -m 755 -D -t "${pkgdir}/usr/bin/" mirrord
    rm -f mirrord
}

