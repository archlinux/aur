# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.3.3
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
    '5465f86cbd00c39a66b12ec5861dbce5cd54678f72857fbfa586c225055b64a0838f356fc2d7fe0a3acb5ed5b9a00553af84eae0eef96afdf75381000d5a2256'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
