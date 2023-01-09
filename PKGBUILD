# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.7.2
pkgrel=3
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache')
source=("switcher_linux_amd64-${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64"
        "switch.sh-${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('24e8909aa5bd7ea8b1f486b46d1506ae6fcbcefe16d89c28884e9d217d8ada70'
            '9c01adbe98329cc43bf6e1832e6d98de934e368ca170ba8260ff710c826d4116')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64-${pkgver}" "$pkgdir/usr/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh-${pkgver}" "$pkgdir/usr/bin/switch.sh"
}
