# Maintainer: oliik <sigmatwojastara@gmail.com>
pkgname=misty-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Misty pics in CLI"
arch=('any')
url="https://github.com/oliik2013/misty-cli"
license=('MIT')

depends=('bash' 'curl' 'chafa')  # runtime deps here

source=("https://raw.githubusercontent.com/oliik2013/misty-cli/refs/heads/main/misty-cli.sh" "https://raw.githubusercontent.com/oliik2013/misty-cli/refs/heads/main/LICENSE")
sha256sums=('a335d59600cacbc1293774e4fc83716f5450196832782ea27c0f40f1cc485362' 'c98a2204d7305e373b4e36f4bc61626c0041e4ec1ed38c20c24b6bbfb95fca82')  # replace with real sum later

package() {
  install -Dm755 "$srcdir/misty-cli.sh" "$pkgdir/usr/bin/misty-cli"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
