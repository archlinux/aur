# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache-2.0')
source=("switcher_linux_amd64-${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64"
        "switch.sh-${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('1034ff417568454c80da9de05a24f70905fccc234eb63adb7ed7b17da57e92de'
            '661609a860ac75377423656c878e904d8b0ba4fd5613717e43d6499ad76e233b')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64-${pkgver}" "$pkgdir/usr/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh-${pkgver}" "$pkgdir/usr/bin/switch.sh"
}
