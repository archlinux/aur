# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=rootlesskit-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="Linux-native 'fake root' for implementing rootless containers"
arch=('x86_64')
url="https://github.com/rootless-containers/rootlesskit"
license=('Apache')
optdepends=('containerd')
source=("https://github.com/rootless-containers/rootlesskit/releases/download/v${pkgver}/rootlesskit-x86_64.tar.gz")
sha256sums=('2471175df4fea05121a44b26624aa4ac91fbe956a97f580bdf6d0409ebfba99c')

package() {
  install -Dm 755 "$srcdir/rootlesskit" "$pkgdir/usr/bin/rootlesskit"
  install -Dm 755 "$srcdir/rootlesskit-docker-proxy" "$pkgdir/usr/bin/rootlesskit-docker-proxy"
  install -Dm 755 "$srcdir/rootlessctl" "$pkgdir/usr/bin/rootlessctl"
}
