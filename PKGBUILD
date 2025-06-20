# Maintainer: adamanteye <ada@adamanteye.cc> 
pkgname=ttf-lxgw-wenkai-tc-mono
pkgver=1.520
pkgrel=1
pkgdesc="The traditional chinese mono version of LXGW WenKai."
arch=('any')
url='https://github.com/lxgw/LxgwWenkaiTC'
license=('OFL-1.1')
source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('71d6c1d7a2d3780859081fecc84e3d1997f0cb34388d115bcdd6fb5291c8dbf9')
package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp LXGWWenKaiMono*.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
