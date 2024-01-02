# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=mirrord-bin
pkgver=3.81.0
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
sha256sums=('b6c058b1c08fa812f6fd9835edb8ffa2e8f57bce93b1893ac60a8dcfef60ff84')

package() {
    mv "mirrord_${pkgver}" mirrord
    install -m 755 -D -t "${pkgdir}/usr/bin/" mirrord
    rm -f mirrord
}

