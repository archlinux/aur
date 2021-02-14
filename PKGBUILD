# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Maintainer: Doron Cohen <me@doron.dev>

pkgname=antidot-bin
pkgdesc="Cleans up your \$HOME from those pesky dotfiles"
url="https://github.com/doron-cohen/antidot"
license=("MIT")
arch=("x86_64")

pkgver=0.6.1
pkgrel=1

provides=("antidot")
conflicts=("antidot")
depends=()

source=("$url/releases/download/v$pkgver/antidot_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('a59ef94837e338a5280dcec7a0b6aa6b662c77f58c23af7c363d35506a0b9811')

package() {
  install -Dm 0755 "$srcdir/antidot" "$pkgdir/usr/bin/antidot"
}
