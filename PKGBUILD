# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=0.8.3
pkgrel=2
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
    "https://resource.u-tools.cn/currentversion/utools_$pkgver-beta_amd64.deb"
)
sha512sums=(
    '10531ee4de2e16b19a863468ac4c95bcd900fcbe979f1a851227ce767c778d1659b703677ed6ae25e18831186020a7d61784b8270d0e2311b1c8b6bee3383e0b'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
