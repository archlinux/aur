# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.001
_commit=752e11f6105adaeef241982be142f56d70141354
pkgrel=5
pkgdesc='Adobe Source Han Sans - Classic Style Chinese Character'
arch=('any')
url="https://github.com/redchenjs/source-han-sans-classic"
license=('custom:OFL')
source=("https://github.com/redchenjs/source-han-sans-classic/archive/$_commit/source-han-sans-classic-$_commit.tar.gz")
sha512sums=('9cfae760aa770829e80f4912500399473e354585e4cd41f2c9292ba4cc5aac01d71d2148d2cfe466362ad1067f0c91b8951ef0f99913d1bc6cf8de7f1009510f')

package() {
    cd source-han-sans-classic-$_commit
    mkdir -p "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
    install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
