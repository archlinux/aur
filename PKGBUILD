# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.0.6
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
    '61bebdfdd21e3cd9e189af5324a3ad89783381cff7d74a71c7517d1a5891ef8ba8d6900e48a2bedd5e07832426ea6cc1c711d867cfb8190b02991f2bc048f9ea'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
