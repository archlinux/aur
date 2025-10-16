# Maintainer: black_shadow <your@email.com>
pkgname=csrf-brute
pkgver=1.0.0
pkgrel=1
pkgdesc="CSRF-aware brute force tool with Hydra-style syntax"
arch=('any')
url="https://github.com/black-shadow/csrf-brute"
license=('MIT')
depends=('python' 'python-requests')
source=("csrf_hydra.py"
        "LICENSE"
        "README.md")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
  install -Dm755 csrf_hydra.py "$pkgdir/usr/bin/csrf-brute"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}