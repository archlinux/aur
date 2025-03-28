# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=ttf-lxgw-bright-code-tc
pkgver=2.711
pkgrel=1
pkgdesc="A merged font of Monaspace Argon and LXGW WenKai."
arch=('any')
url='https://github.com/lxgw/LxgwBright-Code'
license=('OFL-1.1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('229d28d625c1d8a45578704bc29bd66939b55cf7d17802ce568966e32e504535')
package() {
    cd "LxgwBright-Code-$pkgver/LxgwBrightCodeTC"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp LXGWBrightCodeTC-*.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "../OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
