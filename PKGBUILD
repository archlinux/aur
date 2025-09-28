# Maintainer: Nicholas Montgomery <dev@nickmont.net>
pkgname=proj
pkgver=1.0.0
pkgrel=1
pkgdesc="Helper to manage project context across a system"
arch=('any')
url="https://github.com/nick-montgomery/proj"
license=('MIT')
depends=('bash')
source=("https://github.com/nick-montgomery/proj/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('462dcedef2b237f7289c84289cb9edd8ff498bf579c7c54bd15e6f95ea4273ad')

package() {
  cd "$srcdir/proj-${pkgver}"
  install -Dm755 proj "$pkgdir/usr/bin/proj"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
