# Maintainer: Ahmet Altindis
pkgname=archype-vicinae-ext
pkgver=0.1.0
pkgrel=1
pkgdesc="Vicinae commands for Archype (Brave links with containers)"
arch=(any)
url="https://github.com/ahaltindis/archype-vicinae-ext"
license=(MIT)
depends=(vicinae 'brave>=1.95')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3e81d17e63a22bf15d45f6921126bc24201b35b37fd17944f3982b7eb06a34b4')
install=$pkgname.install

package() {
  cd archype
  find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/vicinae/extensions/archype/{}" \;
}
