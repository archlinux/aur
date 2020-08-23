# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.2.0
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
    '4a1c37d91996bc8d3bcbb02ef0c584c474bdb5527212aa740d0e9b6638c5423d70d5422dbeb3cd451509fbbb7658c446f596a4481dedfa2709f9eff205d6d77d'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
