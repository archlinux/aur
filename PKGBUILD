# Maintainer: Yufan You <ouuansteve at gmail>
# Maintainer: asm0dey <me@asm0dey.site>

pkgname=docker-pussh
pkgver=0.4.0
pkgrel=1
pkgdesc='Push docker images directly to remote servers without an external registry'
arch=(any)
url='https://github.com/psviderski/unregistry'
license=('Apache-2.0')
source=("docker-pussh-$pkgver::$url/raw/refs/tags/v$pkgver/docker-pussh")
sha256sums=('f1c5757bf3d5d930c8eccb7b63c374f60333b1869e315d6524f40151a4fd7cf2')
depends=(docker bash openssh)

package() {
    install -Dm 755 "$srcdir/docker-pussh-$pkgver" "$pkgdir"/usr/lib/docker/cli-plugins/docker-pussh
}
