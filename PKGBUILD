pkgname=scrypt-kdf-git
_gitname=scrypt
pkgver=2e054c2
pkgrel=1
pkgdesc='library and command-line utility for the scrypt key derivation function'
arch=(any)
license=(bsd, gpl3)
makedepends=(git)
provides=(scrypt-kdf)
depends=()
source=("git://github.com/jkalbhenn/$_gitname.git")
url=https://github.com/jkalbhenn/$_gitname
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

package() {
  cd $_gitname
  ./exec/make+install.sh "$pkgdir"
}
