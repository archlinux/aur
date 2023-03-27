# Maintainer: Deltara <boided420 at gmail dot com>
pkgname="cumsay-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="A talking sperm that echos cli arguments."
arch=("x86_64")
license=("custom")
provides=("cumsay")
conflicts=("cumsay")
url="https://apt.vilari.site/"
source=("https://apt.vilari.site/cum/cumsay_${pkgver}_1_amd64.deb")
sha256sums=("b2c085098a6c4f5ee85e869c0bc67629c9fefc77dfb10d003fa99a08b7d6162a")

prepare() {
    tar -xvf data.tar.xz
    tar -xvf control.tar.xz
}

package() {
    install -Dm755 usr/bin/cumsay ${pkgdir}/usr/bin/cumsay
    install -Dm644 licenses/LICENSE.md ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
