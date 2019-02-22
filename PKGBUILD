pkgname=scrypt-kdf-git
pkgrel=1
pkgver=89
pkgdesc='library and command-line utility for the scrypt key derivation function'
arch=(i686 x86_64)
license=(bsd gpl3+)
makedepends=(git gcc)
provides=(scrypt-kdf)
depends=()
conflicts=(libscrypt)
source=("git://github.com/jkalbhenn/scrypt")
url=https://github.com/jkalbhenn/scrypt
md5sums=(SKIP)

pkgver() {
  cd scrypt
  git rev-list --count HEAD
}

build() {
  cd scrypt
  ./exe/compile
}

package() {
  cd scrypt
  ./exe/install "$pkgdir"
}
