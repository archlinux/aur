# Maintainer: Deltara <boided420 at gmail dot com>
pkgname="cumsay-bin"
pkgver=0.0.3
pkgrel=1
pkgdesc="A talking sperm that echos cli arguments."
arch=("x86_64")
license=("custom")
provides=("cumsay")
conflicts=("cumsay")
url="https://apt.vilari.site/"
source=("https://apt.vilari.site/cum/cumsay_${pkgver}_amd64.deb")
sha256sums=("72c7176598371e4c8b0b25fc66dab150cc9b5e7bf83de4796276882aefd3dfb3")

prepare() {
    tar -xvf data.tar.xz
    tar -xvf control.tar.xz
}

package() {
    install -Dm755 usr/bin/cumsay ${pkgdir}/usr/bin/cumsay
    cp -rp usr/share/ ${pkgdir}/usr/share/
    # install -Dm644 licenses/LICENSE.md ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
