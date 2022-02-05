# Maintainer: oxodao <oxodao@gmail.com>
pkgname=metaprint-bin
pkgver=0.4
pkgrel=1
pkgdesc="Give up on your random scripts ! Easily render any computer infos for stuff like i3, tmux, ..."
arch=('x86_64')
url="https://github.com/oxodao/metaprint"
license=('GPL')
optdepends=()
source=("https://github.com/oxodao/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver-linux-$CARCH")
md5sums=('SKIP')

package() {
    install -Dm 777 "$pkgname-v$pkgver-linux-$CARCH" "${pkgdir}/usr/bin/metaprint"
}
