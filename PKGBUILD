# Maintainer: nicknb <nicknb at posteo dot com>
pkgname=fuzpad
pkgver=2.05.00
pkgrel=1
pkgdesc="A minimalistic note management solution. Powered by fzf"
arch=("x86_64")
url="https://github.com/JianZcar/FuzPad"
license=("GPL-3.0-only")
provides=("$pkgname")
depends=("fzf")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0fd052ac62c6e7ebb712aa3a8b64d6ece99837680358463b968204b2f358d867')

package() {
    cd "FuzPad-$pkgver"
    install -Dm 0755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
