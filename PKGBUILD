# Maintainer: Ahmet Altindis
pkgname=archype-vicinae-ext
pkgver=0.1.1
pkgrel=1
pkgdesc="Vicinae commands for Archype (Brave links with containers)"
arch=(any)
url="https://github.com/ahaltindis/archype-vicinae-ext"
license=(MIT)
depends=(vicinae 'brave>=1.95')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b69b62e5a4def48a7ccb9824f9f060e3ff2f77426c21de3d3a9ce938219cb498')
install=$pkgname.install

package() {
  cd archype
  find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/vicinae/extensions/archype/{}" \;
}
