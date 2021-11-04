# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache')
source=("https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64" "https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('dc0c487b270755dc7fddf1b2dcceb54642067da42f4b0f25022d3ce1318b26b8' '3a629c2d1065adccbf636eb1c9f86884bad336d4d7ad06424801f461c16c6c4e')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64" "$pkgdir/usr/local/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh" "$pkgdir/usr/local/bin/switch.sh"
}
