# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=naml-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Not another markup language. Framework for replacing Kubernetes YAML with Go."
arch=('x86_64')
url="https://github.com/kris-nova/naml"
license=('Apache')
source=("https://github.com/kris-nova/naml/releases/download/v${pkgver}/naml-linux-amd64")
sha256sums=('ed5aada513f1b28d218fce27fc6e9b44cae997618eb6aa009766b2878704031c')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/naml-linux-amd64" "$pkgdir/usr/bin/naml"
}
