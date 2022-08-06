# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.9.0
pkgrel=1
pkgdesc="小鹤音形 rime 挂接文件"
arch=('x86_64')
url="http://flypy.com/"
license=('unknown')
depends=('rime-lua-hook')
optdepends=('ibus-rime: input support'
            'fcitx-rime: input support'
            'fcitx5-rime: input support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cubercsl/rime-flypy/archive/v$pkgver.tar.gz")
sha256sums=('42cae2f2249877625d55271903472cc1c15a9b3d1cb308e1642d0792995774cb')
install="$pkgname.install"

package() {
    cd "$srcdir/$pkgname-$pkgver"/
    make PREFIX=/usr "DESTDIR=$pkgdir" 
}
