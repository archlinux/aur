# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your \$HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.6.2
pkgrel=1

provides=("antidot")
conflicts=("antidot")
depends=()

source=("$url/releases/download/v$pkgver/antidot_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('3027e8a1f79741c5b644cf00e52aa232864ca76a8f813337eab343bc123605ed')

package() {
  install -Dm 0755 "$srcdir/antidot" "$pkgdir/usr/bin/antidot"
}
