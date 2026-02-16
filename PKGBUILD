# Maintainer: Xuelin Yang <xuelin@adamanteye.cc>
pkgname=ttf-lxgw-wenkai-tc-mono
pkgver=1.521
pkgrel=1
pkgdesc="The traditional chinese mono version of LXGW WenKai."
arch=('any')
url='https://github.com/lxgw/LxgwWenkaiTC'
license=('OFL-1.1')
source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('b1e71497dd6c47a0201c3d5a73dea46b806d68c8dd41850f9f354cee382fe67e')
package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp LXGWWenKaiMono*.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
