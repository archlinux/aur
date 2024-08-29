pkgname=polytope-cli-bin
pkgver=0.1.30
pkgrel=1
pkgdesc="Polytope is a programmable software development platform. This package installs CLI for managing polytope-managed services"
arch=('x86_64')
url="https://github.com/polytopelabs/homebrew-tap"
license=('Unknown')
depends=()
options=('!strip' '!debug')
source=("pt-$pkgver-linux-amd64.gz::https://polytope.com/releases/polytope-cli-$pkgver-linux-amd64.gz")
sha256sums=('716bf2e7e97af4c7a8c9b31f517f3e72ef678fa912fe51e36582f5cf43338aca')

package() {
    cd "$srcdir"
    gunzip -c "pt-$pkgver-linux-amd64.gz" > pt
    chmod +x pt
    install -Dm755 pt "$pkgdir/usr/bin/pt"
}
