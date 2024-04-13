pkgname=polytope-cli-bin
pkgver=0.1.25
pkgrel=1
pkgdesc="Polytope is a programmable software development platform. This package installs CLI for managing polytope-managed services"
arch=('x86_64')
url="https://github.com/polytopelabs/homebrew-tap"
license=('Unknown')
depends=()
options=('!strip' '!debug')
source=("pt-$pkgver-linux-amd64.gz::https://polytope-cli-releases.s3.eu-north-1.amazonaws.com/pt-$pkgver-linux-amd64.gz")
sha256sums=('0b663f397a68bcb8b555aa55efaa81a9fc1022957170f8309627e336d3d17427')

package() {
    cd "$srcdir"
    gunzip -c "pt-$pkgver-linux-amd64.gz" > pt
    chmod +x pt
    install -Dm755 pt "$pkgdir/usr/bin/pt"
}
