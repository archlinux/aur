# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=ttf-lxgw-wenkai-tc-mono
pkgver=1.510
pkgrel=1
pkgdesc="The traditional chinese mono version of LXGW WenKai."
arch=('any')
url='https://github.com/lxgw/LxgwWenkaiTC'
license=('OFL-1.1')
source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('81c3c41acd686b0c5119c2996b0c49b09d2ad7bf5977d880148a659c5e28598e')
package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp LXGWWenKaiMono*.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
