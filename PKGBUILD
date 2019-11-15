# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=0.8.7
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
    '1113807959e14ed272ab5d41b4fab77742ed7c1a07e7339207cf235fbb5bbc4132dba7e7276a4be99d3f454a7cebbc5ec58c68fb28dfbebd91afa6ccc28fa971'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
