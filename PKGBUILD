# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=nerdctl-bin
pkgver=0.7.2
pkgrel=2
pkgdesc="Docker-compatible CLI for containerd"
arch=('x86_64')
url="https://github.com/containerd/nerdctl"
license=('Apache')
optdepends=('containerd')
source=("https://github.com/containerd/nerdctl/releases/download/v${pkgver}/nerdctl-${pkgver}-linux-amd64.tar.gz")
sha256sums=('9626b04198d34fd9cff4974707ec1210ea8d474b89110ea434ade66f993489d0')

package() {
  install -Dm 755 "$srcdir/nerdctl" "$pkgdir/usr/bin/nerdctl"
  install -Dm 755 "$srcdir/containerd-rootless-setuptool.sh" "$pkgdir/usr/bin/containerd-rootless-setuptool.sh"
  install -Dm 755 "$srcdir/containerd-rootless.sh" "$pkgdir/usr/bin/containerd-rootless.sh"
}
