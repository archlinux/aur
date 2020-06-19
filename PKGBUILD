# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.1.1
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
    '0f185994bf9e253729f7ea2aca34c994e191377608d9a5d5d954de9e17e65c8cec1fb417d86ee36d827a7dbd318e93b7a3ceb0a78c241ac8fe28abd329e69826'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
