# Maintainer: Ainola <brett@archlinux.org>
# Contributor: Thomas Weißschuh

pkgname=ttf-lato
pkgver=2.015
pkgrel=2
pkgdesc='A sanserif typeface family bearing the Polish name of "Summer"'
url="https://www.latofonts.com/lato-free-fonts/"
license=('custom:OFL')
arch=('any')
source=("$pkgname-$pkgver.zip::https://www.latofonts.com/download/Lato2OFL.zip")
sha256sums=('42b54e96c07e299d967fc3227c7bd63a20d6cfb1dc8fd6dae83628091e20a5b8')

package() {
    cd Lato2OFL
    install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.txt -t "$pkgdir/usr/share/doc/$pkgname/"
}
