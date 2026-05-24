# Maintainer: Xuelin Yang <xuelin@adamanteye.cc>
pkgname=ttf-lxgw-bright-code-tc
pkgver=2.922
pkgrel=1
pkgdesc="A merged font of Monaspace Argon and LXGW WenKai."
arch=('any')
url='https://github.com/lxgw/LxgwBright-Code'
license=('OFL-1.1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b2ca50d8a8ef5c0f5cdf5bde9efafcf3a0e5c03650a428a2e411acc084d1ec95')
package() {
    cd "LxgwBright-Code-$pkgver/LxgwBrightCodeTC"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp LXGWBrightCodeTC-*.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "../OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
