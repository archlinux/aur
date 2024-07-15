# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=zls-13
pkgver=0.13.0
pkgrel=1
pkgdesc="A Zig language server supporting Zig developers with features like autocomplete and goto definition"
arch=('x86_64')
url="https://github.com/zigtools/zls"
license=('MIT')
depends=()
makedepends=()
provides=("zls")
conflicts=('zls' 'zls-git' 'zls-nightly-bin')
source=("https://github.com/zigtools/zls/releases/download/0.13.0/zls-x86_64-linux.tar.xz")

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" zls
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('ec4c1b45caf88e2bcb9ebb16c670603cc596e4f621b96184dfbe837b39cd8410')
