# Maintainer: oxodao <oxodao@gmail.com>
pkgname=sshelter-bin
pkgver=0.2
pkgrel=1
pkgdesc="Client for the sshelter tool"
arch=('x86_64')
url="https://github.com/oxodao/sshelter-client"
license=('GPL')
optdepends=()
source=("https://github.com/oxodao/sshelter-client/releases/download/v$pkgver/metaprint-v$pkgver-linux-$CARCH")
md5sums=('SKIP')

package() {
    install -Dm 777 "sshelter-v$pkgver-linux-$CARCH" "${pkgdir}/usr/bin/sshelter"
}
