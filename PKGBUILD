pkgname=fetchify
pkgver=1.0.2
pkgrel=1
arch=('x86_64')
url="https://github.com/GrandTheBest/fetchify"
license=('GNU General Public License')
source=("https://github.com/GrandTheBest/fetchify/releases/download/$pkgver-generic/fetchify-1.0.0-linux-amd64.tar.gz")
sha256sums=('8395c4d0a252591fa859cf4b16dc7d54dadba8ec77370cdfff7d4097fea4a56b')  # Проверь sha256sum своего архива

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-linux-amd64/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

