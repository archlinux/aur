# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-tc
pkgver=1.510
pkgrel=1
pkgdesc="The Traditional Chinese Version of LXGW WenKai"
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiTC'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('81c3c41acd686b0c5119c2996b0c49b09d2ad7bf5977d880148a659c5e28598e')


package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
