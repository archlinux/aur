# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=0.8.9
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
    'd599e1d6b8cfc94816b212fef6fb8968a15b214f857268d80064fafd0dba6b19c7b65181c98f8f01b038ecd8ffe865ea67ad1240f60e06f2339911e26a6c1cf6'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
