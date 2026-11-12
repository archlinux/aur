# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

pkgname=och
pkgver=0.1.9
pkgrel=1
pkgdesc='Small helper for OpenClaw TUI session management.'
arch=('any')
url='https://github.com/shbernal/och'
license=('MIT')
depends=('bash' 'jq' 'moreutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('87f3c6d3bfad493ebadd0642dd782f3fc1bcc2d43759a7e0eceaef025d84b7e6')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 och "$pkgdir/usr/bin/och"
  install -Dm644 completions/och.bash "$pkgdir/usr/share/bash-completion/completions/och.bash" 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
