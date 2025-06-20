# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=ttf-lxgw-bright-code-tc
pkgver=2.720
pkgrel=1
pkgdesc="A merged font of Monaspace Argon and LXGW WenKai."
arch=('any')
url='https://github.com/lxgw/LxgwBright-Code'
license=('OFL-1.1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c65dfe52303e77ff7d8496c34e444827098ae9562e1320d86dbcb1e2cef0549e')
package() {
    cd "LxgwBright-Code-$pkgver/LxgwBrightCodeTC"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp LXGWBrightCodeTC-*.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "../OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
