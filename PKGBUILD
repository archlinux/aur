# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=28.3.1
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=("x86_64")
provides=("docker")
conflicts=("docker" "podman-docker")
depends=("glibc")

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=("452fe4ba4fd8dc0581c4f328aa4ad68e42668e022b56b98ead8597aae9d8c8e9015293695ef98d78c6ee1285a6c036c3d65f7fc357114f24a5c6dbfea619e176")

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
