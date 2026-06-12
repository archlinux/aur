# Maintainer: Yufan You <ouuansteve at gmail>
# Maintainer: asm0dey <me@asm0dey.site>

pkgname=docker-pussh
pkgver=0.4.3
pkgrel=1
pkgdesc='Push docker images directly to remote servers without an external registry'
arch=(any)
url='https://github.com/psviderski/unregistry'
license=('Apache-2.0')
source=("docker-pussh-$pkgver::$url/raw/refs/tags/v$pkgver/docker-pussh")
sha256sums=('3d97722b5f2804157f5ed65e7f2fa20695700c15a667b127d128f60a7527d5c8')
depends=(docker bash openssh)

package() {
    install -Dm 755 "$srcdir/docker-pussh-$pkgver" "$pkgdir"/usr/lib/docker/cli-plugins/docker-pussh
}
