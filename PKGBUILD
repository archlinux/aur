# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=fuzpad
pkgver=2.04.01
pkgrel=1
pkgdesc="A minimalistic note management solution. Powered by fzf"
arch=("x86_64")
url="https://github.com/JianZcar/FuzPad"
license=("GPL-3.0-only")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('336ed4f0822520b63ddeb88f843507931382348a897f5a19e7a9d06265e31df6')

package() {
    cd "FuzPad-$pkgver"
    install -Dm 0755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
