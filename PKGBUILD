# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.0.4
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
    '0f5a46ee1cb922ad412f61792b3ae70a91e25f35e0ab94e3e2a3ad8c9031f63f680c75a4881065637d966f3ea93361def1fb9cfb4699af29c5fd644d04d07998'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
