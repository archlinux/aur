# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=26.1.0
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=('x86_64')
provides=("docker")
conflicts=("docker" "podman-docker")
depends=('glibc')

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=('583a94106d41c1b88bcddd740d835dd2d294dbafc600afc9f2a99f773a38459202bf2137d0236de99f5b1bf396f550ad989bfbd36b90319d32cf5b003b0d45fe')

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
