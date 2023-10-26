# Maintainer: moyiz <8603313+moyiz@users.noreply.github.com>
pkgname=wander-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="An efficient terminal application/TUI for your HashiCorp Nomad cluster."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/robinovitch61/wander"
license=('MIT')
depends=('glibc')
provides=('wander')

source_i686=("https://github.com/robinovitch61/wander/releases/download/v${pkgver}/wander_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("https://github.com/robinovitch61/wander/releases/download/v${pkgver}/wander_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/robinovitch61/wander/releases/download/v${pkgver}/wander_${pkgver}_Linux_arm64.tar.gz")
sha256sums_i686=('4c70a1a6af8c073feb414b1a7833a20427e29cbfb53b3ee60c32c4a841e08246')
sha256sums_x86_64=('b05e0243f054aacc9addd2c83af380a5269f74134c490bfaf950e4bed8021ef3')
sha256sums_aarch64=('d1656f5439fd4777e4e1daccdd26402f857793d37c2f9b541b9c2e735f2e46ee')

package() {
    cd $srcdir
    install -Dm755 wander $pkgdir/usr/bin/wander
}
