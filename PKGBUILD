# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.1.3
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
    'c6190531f0761c2bd1940dc0fd6bd6401e3f301b136573da85759cfe1deabe4fd699691840735234146d3dbb89cd17152853566ec7182d2ff183366b7a103f13'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
