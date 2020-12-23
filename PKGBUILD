# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your $HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.4.2
pkgrel=7

provides=("antidot")
conflicts=("antidot")
depends=()

source=("antidot-0.4.2.bin::https://github.com/doron-cohen/antidot/releases/download/v0.4.2/antidot_0.4.2_linux_amd64")
sha256sums=("79e48362d5a5b078121b56c31168d649b10269f5f3bfb3161a3513ed627a5d15")

package() {
  install -Dm 0755 "$srcdir/antidot-0.4.2.bin" "$pkgdir/usr/bin/antidot"
}
