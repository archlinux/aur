# Maintainer: shbernal <shbernal.01@gmail.com>
pkgname=och
pkgver=0.1.1
pkgrel=1
pkgdesc='Helper script for some OpenClaw TUI gaps'
arch=('any')
url='https://github.com/shbernal/och'
license=('MIT')
depends=('bash' 'jq' 'moreutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dad412bfc58e1d13b01660277c9b53f61f722a5134b175bc069893bb8b064885')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 och "$pkgdir/usr/bin/och"
  install -Dm644 completions/och.bash "$pkgdir/usr/share/bash-completion/completions/och.bash" 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
