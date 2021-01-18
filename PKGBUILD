# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your \$HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.5.0
pkgrel=7

provides=("antidot")
conflicts=("antidot")
depends=()

source=("$url/releases/download/v0.5.0/antidot_0.5.0_Linux_x86_64.tar.gz")
sha256sums=('1f2ea4b8fbca1bbac5483dc47dfd5695723176452bc1eecf0e9a9bc71c4fef9a')

package() {
  install -Dm 0755 "$srcdir/antidot" "$pkgdir/usr/bin/antidot"
}
