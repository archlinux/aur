# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=fuzpad
pkgver=2.04.02
pkgrel=1
pkgdesc="A minimalistic note management solution. Powered by fzf"
arch=("x86_64")
url="https://github.com/JianZcar/FuzPad"
license=("GPL-3.0-only")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('773316cb29e595a5b7962248151206b2422ed6f763953bf94881b551f4e666ef')

package() {
    cd "FuzPad-$pkgver"
    install -Dm 0755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
