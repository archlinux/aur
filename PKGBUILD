# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0s-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="k0s - Zero Friction Kubernetes"
arch=('x86_64')
url="https://github.com/k0sproject/k0s"
license=('Apache')
source=("https://github.com/k0sproject/k0s/releases/download/v${pkgver}/k0s-v${pkgver}-amd64")
sha256sums=('8771e2fbc011c7a01fff691f17c3f7688bafb3cd4d7b4e50fbcc7ded1ae8d620')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0s-v${pkgver}-amd64" "$pkgdir/usr/bin/k0s"
}
