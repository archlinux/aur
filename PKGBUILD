# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=rootlesskit-bin
pkgver=0.14.5
pkgrel=1
pkgdesc="Linux-native 'fake root' for implementing rootless containers"
arch=('x86_64')
url="https://github.com/rootless-containers/rootlesskit"
license=('Apache')
optdepends=('containerd')
source=("https://github.com/rootless-containers/rootlesskit/releases/download/v${pkgver}/rootlesskit-x86_64.tar.gz")
sha256sums=('9e485a07e9fb133d4db964cdf84a610c2d5eeffdb5b5e60b9425f802562502f5')
provides=('rootlesskit')
conflicts=('rootlesskit')

package() {
  install -Dm 755 "$srcdir/rootlesskit" "$pkgdir/usr/bin/rootlesskit"
  install -Dm 755 "$srcdir/rootlesskit-docker-proxy" "$pkgdir/usr/bin/rootlesskit-docker-proxy"
  install -Dm 755 "$srcdir/rootlessctl" "$pkgdir/usr/bin/rootlessctl"
}
