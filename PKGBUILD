# Maintainer: paranoid73 <kevinguelade@gmail.com>

pkgname=lightdm-webkit-theme-tactical
pkgver=1.1.0
pkgrel=1
pkgdesc="Minimal dark tactical login theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/paranoid73/lightdm-webkit-theme-tactical"
license=('MIT')
depends=('lightdm-webkit2-greeter')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2c33dfb3740bcfa4f56eb0104ebc4885294cd8f3b047598a151a6cbb12f4836b')

package() {
    install -d "$pkgdir/usr/share/lightdm-webkit/themes/tactical"
    cp -r "$srcdir/$pkgname-$pkgver"/{index.html,index.theme,img} \
        "$pkgdir/usr/share/lightdm-webkit/themes/tactical/"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
