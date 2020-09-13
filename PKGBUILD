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
    '03e42d4c59eb7b3273498b4d4c8f8dbdf66d0c77cabfb958040859949b5ea502c8bd62d437b0ede7fbd414b6f23c0846406fb4a7090360538dd1a746b12a74fa'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
