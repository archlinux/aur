# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=mirrord-bin
pkgver=3.169.0
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
sha256sums=('b3c95707d3630d5c62f2a6cb194038501dc39f7dc29d507ee846da521bae3f16')

package() {
    mv "mirrord_${pkgver}" mirrord
    install -m 755 -D -t "${pkgdir}/usr/bin/" mirrord
    rm -f mirrord
}

