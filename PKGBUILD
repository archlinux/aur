# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.0.7
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
    'd46977e5b4b522e78c36b133c5ef046745f70142a55327fa1b4236c51d419233044c778e27c711f57e21e4e7f664fca2dd9532f9dab9802535d99ffd51249dc9'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
