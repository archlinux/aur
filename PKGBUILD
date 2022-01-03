# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=naml-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Not another markup language. Framework for replacing Kubernetes YAML with Go."
arch=('x86_64')
url="https://github.com/kris-nova/naml"
license=('Apache')
source=("https://github.com/kris-nova/naml/releases/download/v${pkgver}/naml-linux-amd64")
sha256sums=('7a75c25a78ad311dcbdeea838021435813909386da19445a308ca9f7f8ff4d3e')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/naml-linux-amd64" "$pkgdir/usr/bin/naml"
}
