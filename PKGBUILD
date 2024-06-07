# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=26.1.4
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=("x86_64")
provides=("docker")
conflicts=("docker" "podman-docker")
depends=("glibc")

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=("bb323ef7059ee03b5bf58a7c9b48d7230b40bdfb44f9c286f381f3cb82e16959f8b633438343a805eb58292d2dc87f815e1d0cb5e83886483aadf8a45a0ebdb0")

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
