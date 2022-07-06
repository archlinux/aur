# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache')
source=("https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64" "https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('0e0260421065ff24f0257658e2367438bd2b8d687d2d3fd0500054af8d8bcc44'
            'be0869f11b88f694a24030ebc0f494ec991e7046028b48e11a7d71ff66235ffe')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64" "$pkgdir/usr/local/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh" "$pkgdir/usr/local/bin/switch.sh"
}
