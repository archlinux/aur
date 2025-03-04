# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=28.0.1
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=("x86_64")
provides=("docker")
conflicts=("docker" "podman-docker")
depends=("glibc")

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=("74353437f4bc93a8e008ff4fdb7cebfb8cc5cf5a41d6aef279511dc4211da56ababb5c73e19ddcb5a4db81d00e0ada60004ec265c37aedc9141385ec7fa59cef")

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
