# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache')
source=("switcher_linux_amd64-${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64"
        "switch.sh-${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('c943332f30e5106ece06bd06e6bda91b577961526a532b33c917b35af5acb887'
            '11d6f4b6d32632cf4080e67b72e99352cb50e8866543732f70998a20e0b77d47')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64-${pkgver}" "$pkgdir/usr/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh-${pkgver}" "$pkgdir/usr/bin/switch.sh"
}
