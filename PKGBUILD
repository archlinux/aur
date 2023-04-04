# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=23.0.2
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=('x86_64')
provides=("docker")
conflicts=("docker" "podman-docker")
depends=('glibc')

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=('15f4cffd887dcebbcc6098304494b4fd354c42077590f577d79e81035d451f2565c3de607d722693de580d7a04da41e84bfc603e1d697896c8dd8fadb76c6b71')

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
