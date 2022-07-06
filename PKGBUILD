# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.8.9
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
sha256sums=('bf8a93a22291a376b6266f52a43aa0664f575f06fcfa48e5865c86f4f7586946')
install="$pkgname.install"

package() {
    cd "$srcdir/$pkgname-$pkgver"/
    make PREFIX=/usr "DESTDIR=$pkgdir" 
}
