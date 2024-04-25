pkgname=polytope-cli-bin
pkgver=0.1.27
pkgrel=1
pkgdesc="Polytope is a programmable software development platform. This package installs CLI for managing polytope-managed services"
arch=('x86_64')
url="https://github.com/polytopelabs/homebrew-tap"
license=('Unknown')
depends=()
options=('!strip' '!debug')
source=("pt-$pkgver-linux-amd64.gz::https://polytope.com/releases/polytope-cli-$pkgver-linux-amd64.gz")
sha256sums=('3df71ea60b5ffd28bae516b6c6eb25c5ee682d4a1119fa53171b55d5bc94f5cf')

package() {
    cd "$srcdir"
    gunzip -c "pt-$pkgver-linux-amd64.gz" > pt
    chmod +x pt
    install -Dm755 pt "$pkgdir/usr/bin/pt"
}
