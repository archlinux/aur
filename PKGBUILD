# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your $HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.4.2
pkgrel=8

provides=("antidot")
conflicts=("antidot")
depends=()

source=("antidot-0.4.2.bin::https://github.com/doron-cohen/antidot/releases/download/v0.4.2/antidot_0.4.2_linux_amd64")
sha256sums=("979cbaf007e57b546cf64f253412a7e03334377faae603b0284b6a5632b9bd53")

package() {
  install -Dm 0755 "$srcdir/antidot-0.4.2.bin" "$pkgdir/usr/bin/antidot"
}
