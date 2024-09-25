# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=27.3.1
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=("x86_64")
provides=("docker")
conflicts=("docker" "podman-docker")
depends=("glibc")

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=("5779e44cc6d36d58226af55d7fc07e610f6433a5c1fe1c32554eecf649d77b6f718eb9ebdfdfccee8f6e6d0a1d8e23dbdcb820c526f3c445feaf7835076e4f57")

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
