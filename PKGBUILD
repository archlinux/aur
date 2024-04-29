# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-tc
pkgver=1.330
pkgrel=1
pkgdesc="The Traditional Chinese Version of LXGW WenKai"
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiTC'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('aa95f9b211f51db18c6b6f3bbbf475acc16041e0140b4c30285543f90493ca1a')


package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
