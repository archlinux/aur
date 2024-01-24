# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=25.0.0
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=('x86_64')
provides=("docker")
conflicts=("docker" "podman-docker")
depends=('glibc')

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=('61db87acac517fa8739589aebb9a11817066de3cfac665e04f9c430f3ea4c48c0479e9990d0c47840d991206dfa8b0f131f7341759d4b6905488f26b1b8d990c')

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
