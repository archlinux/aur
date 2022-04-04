# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache')
source=("https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64" "https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('c93273e3ec228e65e68a669d48ce142acd5343c326ae519a7f3e2e124dc8aecb'
            '93c131f9b8103604bd840d62cd2c5086be63da5454e73789e49bddf9f238088f')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64" "$pkgdir/usr/local/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh" "$pkgdir/usr/local/bin/switch.sh"
}
