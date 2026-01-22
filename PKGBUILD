# Maintainer: Ryan Yuan <ryanyuanzhehan@gmail.com>
pkgname=tegaki-zinnia-simplified-chinese
pkgver=0.3
pkgrel=1
pkgdesc="Zinnia handwriting model for Simplified Chinese (from Tegaki project)"
arch=('any')
url="https://github.com/tegaki/tegaki"
license=('GPL')
source=("https://github.com/tegaki/tegaki/releases/download/v${pkgver}/tegaki-zinnia-simplified-chinese-${pkgver}.zip")
sha256sums=('45bb61a9a5e1ff571de9ac0711c316f29a064260feea6f5db6979ecd980498a3')

package() {
    cd "$srcdir/tegaki-zinnia-simplified-chinese-${pkgver}"
    install -dm755 "$pkgdir/usr/share/tegaki/models/zinnia"
    install -Dm644 *.meta  "$pkgdir/usr/share/tegaki/models/zinnia/"
    install -Dm644 *.model "$pkgdir/usr/share/tegaki/models/zinnia/"
}
