# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=1.3.4
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=('gtk3' 'nss' 'libxss')
source=("https://resource.u-tools.cn/currentversion/utools_${pkgver}_amd64.deb")
sha512sums=('6c9195cb0bf2b1254abe92f963e3b17ef69fa826953209cc893165885eb8dcfa17e359ba205db2fcf48fd8871007ae812caf3b49a844bb80a5ecd8cbcf20dbb7')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
