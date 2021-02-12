# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your \$HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.6.0
pkgrel=1

provides=("antidot")
conflicts=("antidot")
depends=()

source=("$url/releases/download/v$pkgver/antidot_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('e7f4fb4b236678479d25cd95ad37448fe9e65e3e67590c14f951227cb98c8b87')

package() {
  install -Dm 0755 "$srcdir/antidot" "$pkgdir/usr/bin/antidot"
}
