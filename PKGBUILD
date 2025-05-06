# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-tc
pkgver=1.511
pkgrel=1
pkgdesc="The Traditional Chinese Version of LXGW WenKai"
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiTC'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('d9778e37ac3357c3ae16c14a4462a9b0e254c5002c42c16846efaf0f25a83242')


package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
