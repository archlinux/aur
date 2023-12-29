# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=ttf-lxgw-wenkai-tc
pkgver=1.011
pkgrel=1
pkgdesc="The Traditional Chinese Version of LXGW WenKai"
arch=('any')
url='https://github.com/lxgw/LxgwWenKaiTC'
license=('custom:OFL')

source=("$url/releases/download/v$pkgver/lxgw-wenkai-tc-v$pkgver.tar.gz")
sha256sums=('7b8513a34d51e277a34be8bf00e804c931a623958aa049e35d02f1f0fe510375')


package() {
    cd "lxgw-wenkai-tc-v$pkgver"
    install -d "$pkgdir/usr/share/fonts/TTF"
    cp *.ttf "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
