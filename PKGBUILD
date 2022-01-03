# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=kubeswitch-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="The kubectx for operators."
arch=('x86_64')
url="https://github.com/danielfoehrKn/kubeswitch"
license=('Apache')
source=("https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64" "https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switch.sh")
sha256sums=('17759a0e43d342716567f6ca602f3168efc8d1d036dbab79dfba2054d14b318c'
            '93c131f9b8103604bd840d62cd2c5086be63da5454e73789e49bddf9f238088f')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/switcher_linux_amd64" "$pkgdir/usr/local/bin/switcher"
  install -Dm 755 "$srcdir/switch.sh" "$pkgdir/usr/local/bin/switch.sh"
}
