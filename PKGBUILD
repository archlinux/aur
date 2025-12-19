# Maintainer: cnf3rd <subs.in.tokyo@gmail.com>
pkgname=podlet-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Generate Podman Quadlet files from a Podman command'
url='https://github.com/containers/podlet'
source_x86_64=("https://github.com/containers/podlet/releases/download/v$pkgver/podlet-x86_64-unknown-linux-musl.tar.xz")
arch=('x86_64')
license=('MPL-2.0')
depends=()
conflicts=('podlet')
provides=('podlet')
sha256sums_x86_64=('1d112aec2efbf2a9577816d783e944a0cef1afc82b0af208dc3d4505778fe08f')

package() {
  cd "$srcdir/podlet-x86_64-unknown-linux-musl/"
  install -Dm755 podlet "${pkgdir}/usr/bin/podlet"
}
