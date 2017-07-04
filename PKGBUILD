# Maintainer: Gio d'Amelio <giodamelio@gmail.com>
pkgname=git-recover-git
_githash=f7ee394a3ecce2b5b8b0ac94da109058e48678ba
pkgver=1_$_githash
pkgrel=1
epoc=1
pkgdesc="recover deleted files in your repository"
arch=("any")
url="https://github.com/ethomson/git-recover"
license=("MIT")
depends=("bash")
source=("https://github.com/ethomson/git-recover/archive/$_githash.zip")
md5sums=("06360d1467627317489ed6bb3bbe89b2")
sha1sums=("56c6e8738e9b43e8d5b2c68678fb4039f99d9248")

package() {
  cd "git-recover-$_githash"

  install -Dm755 "$srcdir/git-recover-$_githash/git-recover" "$pkgdir/usr/bin/git-recover"
}
