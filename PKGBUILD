# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your $HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.4.2
pkgrel=4

provides=("antidot")
conflicts=("antidot")
depends=()

source=("antidot-0.4.2.bin::https://github.com/doron-cohen/antidot/releases/download/v0.4.2/antidot_v0.4.2_linux_amd64")
sha256sums=("5ddddee4267154950d7bac5f9690d72117526355d3bcc396187bb27d48494b9f")

package() {
  install -Dm 0755 "$srcdir/antidot-0.4.2.bin" "$pkgdir/usr/bin/antidot"
}
