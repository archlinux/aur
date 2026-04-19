# Maintainer: oliik <sigmatwojastara@gmail.com>
pkgname=misty-cli
pkgver=1.0.2
pkgrel=2
pkgdesc="Misty pics in CLI"
arch=('any')
url="https://github.com/oliik2013/misty-cli"
license=('MIT')
depends=('bash' 'curl' 'chafa')
source=("https://github.com/oliik2013/misty-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('322824f8bb6db0bd9e91c6f3da6a4d47c656a5cf2e77555a9917e7d36926e8e9')

package() {
  cd "$srcdir/misty-cli-$pkgver"

  install -Dm755 misty-cli.sh "$pkgdir/usr/bin/misty-cli"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
