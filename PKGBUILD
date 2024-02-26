# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-tc
pkgver=1.320
pkgrel=1
pkgdesc="The Traditional Chinese Version of LXGW WenKai"
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiTC'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('085f73c15acd18dd2b502a1ee782e4fba196a954426c6fd71646c5fb4964ee53')


package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
