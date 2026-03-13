# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=29.3.0
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=("x86_64")
provides=("docker")
conflicts=("docker" "podman-docker")
depends=("glibc")

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=("0d9574840c4c22d5816aa1a3a2630ebeb7c9ef03480bb1817128e9de39c9ce62bb46f3b8f72638d43c0709c31be8b185cd23905c9864e299b7a7d38b1b115060")

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
