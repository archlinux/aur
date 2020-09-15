# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.3.1
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=(
    'gtk3'
    'nss'
    'libxss'
)
source=(
    "https://resource.u-tools.cn/currentversion/utools_${pkgver}_amd64.deb"
)
sha512sums=(
    '98bb23b5762452903d88eb40377224bdb22be2ce6bda3bd325fac2a3e34de86e9d1442fc55d579985a2c448c61cc7ea91ecf539dc1af86b572be0b83354235b2'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
