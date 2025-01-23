# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=ttf-lxgw-bright-code-tc
pkgver=2.611
pkgrel=1
pkgdesc="A merged font of Monaspace Argon and LXGW WenKai."
arch=('any')
url='https://github.com/lxgw/LxgwBright-Code'
license=('OFL-1.1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80f7e107274754859de3779e56c29f43555a52f9abd7c2933b3f8e241e9ed834')
package() {
    cd "LxgwBright-Code-$pkgver/LxgwBrightCodeTC"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp LXGWBrightCodeTC-*.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "../OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
