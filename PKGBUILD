pkgname=pyfetch-beta
pkgver=1.0.2.beta1
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'python-pyfiglet')
source=('https://github.com/andresr124/pyfetch/releases/download/v1.0.2-rc1/pyfetch-1.0.2-rc1.tar.gz')
sha256sums=('fd96b45374aeec7ee5d3c830cb95308cb48f2c84ba77b8a94f0f49d1590c7b7d')

package() {
  cd "$srcdir/pyfetch-1.0.2-rc1"

  # Install the script
  install -Dm755 pyfetch-beta "$pkgdir/usr/bin/pyfetch-beta"

  # Optionally install README and LICENSE
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
