# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your \$HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.6.3
pkgrel=1

provides=("antidot")
conflicts=("antidot")
depends=()

source=("$url/releases/download/v$pkgver/antidot_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('69bf8e4de2da1fdada2be866d7ba0a0261cbc9e9e5410bd87c79791f2ce6dbdc')

package() {
  install -Dm 0755 "$srcdir/antidot" "$pkgdir/usr/bin/antidot"
}
