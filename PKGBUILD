# Maintainer: shbernal <shbernal.01@gmail.com>
pkgname=och
pkgver=0.1.7
pkgrel=1
pkgdesc='Helper script for some OpenClaw TUI gaps'
arch=('any')
url='https://github.com/shbernal/och'
license=('MIT')
depends=('bash' 'jq' 'moreutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4fd350b13756091a151f9d95204f096b2cd636b105e8a0c37abdc382facd5738')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 och "$pkgdir/usr/bin/och"
  install -Dm644 completions/och.bash "$pkgdir/usr/share/bash-completion/completions/och.bash" 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
