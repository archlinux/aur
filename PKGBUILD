# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.0.2
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
    "https://resource.u-tools.cn/currentversion/utools_$pkgver-beta_amd64.deb"
)
sha512sums=(
    '32b22a95414736ef7e5f00ff9f30d9c118c5f739accfde6eea7e982542cca521cf8dd948112be52322f0d78b489069c741656fb9e97cbc66443f14de5f3ff4d1'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
