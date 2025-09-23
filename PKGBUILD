# Maintainer: Zikeji <me@zikeji.com>

pkgname=gruyere-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="A tiny (and pretty) program for viewing + killing listening ports "
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/savannahostrowski/gruyere"
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/savannahostrowski/gruyere/releases/download/v${pkgver}/gruyere_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/savannahostrowski/gruyere/releases/download/v${pkgver}/gruyere_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::https://github.com/savannahostrowski/gruyere/releases/download/v${pkgver}/gruyere_${pkgver}_linux_386.tar.gz")
sha256sums_x86_64=('70f51ae649be7e75045c2ba19de2cf60deb8f6eda3380ba4630b7dbc93ef0bb2')
sha256sums_aarch64=('6a459f6d0fb1f9455e027958dd4381d473a1018993b723d399fec1f18d592257')
sha256sums_i686=('500ad50ae86dded315ce1044c059511de2c37ed328d09d44aa0e303e9fc9417d')

package() {
    cd "$srcdir"

    install -Dm755 gruyere "$pkgdir/usr/bin/gruyere"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
