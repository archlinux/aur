# Maintainer: oxodao <oxodao@gmail.com>
pkgname=metaprint-bin
pkgver=0.4
pkgrel=2
pkgdesc="Give up on your random scripts ! Easily render any computer infos for stuff like i3, tmux, ..."
arch=('x86_64')
url="https://github.com/oxodao/metaprint"
license=('GPL')
optdepends=()
source=("https://github.com/oxodao/metaprint/releases/download/v$pkgver/metaprint-v$pkgver-linux-$CARCH")
md5sums=('SKIP')

package() {
    install -Dm 777 "metaprint-v$pkgver-linux-$CARCH" "${pkgdir}/usr/bin/metaprint"
}
