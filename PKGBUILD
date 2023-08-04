# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache')
source=("switcher_linux_amd64-${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64"
        "switch.sh-${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('5f341531f557f85b58ac9a8aea7a4d02f694db213ac4b861391ae333bd3cbd5a'
            '11d6f4b6d32632cf4080e67b72e99352cb50e8866543732f70998a20e0b77d47')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64-${pkgver}" "$pkgdir/usr/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh-${pkgver}" "$pkgdir/usr/bin/switch.sh"
}
