# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.8.6
pkgrel=2
pkgdesc="小鹤音形 rime 挂接文件"
arch=('any')
url="http://flypy.com/"
license=('unknown')
depends=('rime-lua-hook')
optdepends=('ibus-rime: input support'
            'fcitx-rime: input support'
            'fcitx5-rime: input support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cubercsl/rime-flypy/archive/v$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('79656b4e6dc5b7e2c081bd4e7c0f30dd70d4387c2d53da41b746b5907b7e741f'
            '07487dba48d81c42c647fae3449c0a52fdcee9edc890c65961122b5304b824eb')
install="$pkgname.install"

package() {
    cd "$srcdir/$pkgname-$pkgver"/
    make PREFIX=/usr "DESTDIR=$pkgdir" 
}
