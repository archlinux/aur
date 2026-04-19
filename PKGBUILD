# Maintainer: oliik <sigmatwojastara@gmail.com>
pkgname=misty-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="Misty pics in CLI"
arch=('any')
url="https://github.com/oliik2013/misty-cli"
license=('MIT')

depends=('bash' 'curl' 'chafa')

source=("https://raw.githubusercontent.com/oliik2013/misty-cli/refs/heads/main/misty-cli.sh" "https://raw.githubusercontent.com/oliik2013/misty-cli/refs/heads/main/LICENSE")
sha256sums=('aaf6c63d7e290963c875551653ea811b466390c4ac91d1efdb6db35fedf52c2d' 'c98a2204d7305e373b4e36f4bc61626c0041e4ec1ed38c20c24b6bbfb95fca82')

package() {
  install -Dm755 "$srcdir/misty-cli.sh" "$pkgdir/usr/bin/misty-cli"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
