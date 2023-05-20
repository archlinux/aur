# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=24.0.1
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=('x86_64')
provides=("docker")
conflicts=("docker" "podman-docker")
depends=('glibc')

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=('6fedd91e49e921bd889aad09c6a373c7f59b31d62df0cf1781d88e524b181171e828c2abd0787b9804bf5043cc1a0a3b1b4a6548e18ddb8d27e31f395d5d591d')

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
