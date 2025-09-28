# Maintainer: Nicholas Montgomery <dev@nickmont.net>
pkgname=projctl
pkgver=1.0.1
pkgrel=1
pkgdesc="Helper to manage project context across a system"
arch=('any')
url="https://github.com/nick-montgomery/projctl"
license=('MIT')
depends=('bash')
source=("https://github.com/nick-montgomery/projctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('35f4bac75d2c5fc7b83c4f10d428cbcecb6cbd717d4cd8dca2c8cb714d3a133b')

package() {
  cd "$srcdir/projctl-${pkgver}"
  install -Dm755 projctl "$pkgdir/usr/bin/projctl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
