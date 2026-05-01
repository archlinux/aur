# Maintainer: shbernal <shbernal.01@gmail.com>
pkgname=och
pkgver=0.1.2
pkgrel=1
pkgdesc='Helper script for some OpenClaw TUI gaps'
arch=('any')
url='https://github.com/shbernal/och'
license=('MIT')
depends=('bash' 'jq' 'moreutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2178d965138f783c24a91fb2812dd43fca94b45b3a44c75980950a9c99fc348c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 och "$pkgdir/usr/bin/och"
  install -Dm644 completions/och.bash "$pkgdir/usr/share/bash-completion/completions/och.bash" 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
