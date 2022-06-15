# Maintainer : Ivo(sh) Musil <ivoshm@gmail.com>

pkgname=docker-cli-bin
pkgver=20.10.17
pkgrel=1
pkgdesc="Docker - CLI utility only, installed from static binary on docker.com"
url="https://docs.docker.com/engine/install/binaries/#install-static-binarie"
license=("Apache")
arch=('x86_64')
provides=("docker")
conflicts=("docker" "podman-docker")
depends=('glibc')

source=("$pkgname-$pkgver.tar.gz::https://download.docker.com/linux/static/stable/x86_64/docker-$pkgver.tgz")
sha512sums=('928dc92ef854e180c8494c38c645a643c344e370ca2f7c55c7cf861b6be08f5c9fd48571a5a7df77e2b64baeed0e4f9dd99e40c0f0ef2c906bbca268be8d9cf6')

package() {
  install -Dm 755 "$srcdir/docker/docker" "$pkgdir/usr/bin/docker"
}
