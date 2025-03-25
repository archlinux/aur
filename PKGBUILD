# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=ttf-lxgw-wenkai-tc-mono
pkgver=1.511
pkgrel=1
pkgdesc="The traditional chinese mono version of LXGW WenKai."
arch=('any')
url='https://github.com/lxgw/LxgwWenkaiTC'
license=('OFL-1.1')
source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('d9778e37ac3357c3ae16c14a4462a9b0e254c5002c42c16846efaf0f25a83242')
package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp LXGWWenKaiMono*.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
