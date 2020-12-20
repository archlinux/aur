# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your $HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.4.2
pkgrel=5

provides=("antidot")
conflicts=("antidot")
depends=()

source=("antidot-0.4.2.bin::https://github.com/doron-cohen/antidot/releases/download/v0.4.2/antidot_v0.4.2_linux_amd64")
sha256sums=("7f07bb69eebba10e6f4cf4bd2de6f2feadee202c32ad4381a654a40dfc2014d8")

package() {
  install -Dm 0755 "$srcdir/antidot-0.4.2.bin" "$pkgdir/usr/bin/antidot"
}
