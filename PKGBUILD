# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.0.3
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
    '34b73f8362189ff6b67a1907872dbe305437c52a310e1e1ebcd98430cb8a0c8f107a36f612bad9bb89834a259280186376c5334012d48709f9a35ad458df25d3'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
