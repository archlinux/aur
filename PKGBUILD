# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache')
source=("https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64" "https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('a44f466dd9105f6366cd295eced390f5638b36656ccad51f2d7db9fa9133e3c0' '37484fb6ccd83ccf0e5b165a4ae04bfd107a510927e1c132310d01e2567fd78b')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64" "$pkgdir/usr/local/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh" "$pkgdir/usr/local/bin/switch.sh"
}
