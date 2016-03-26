pkgname=scrypt-kdf-git
pkgrel=1
pkgver=75
pkgdesc='library and command-line utility for the scrypt key derivation function'
arch=(any)
license=(bsd, gpl3)
makedepends=(git)
provides=(scrypt-kdf)
depends=()
source=("$pkgname::git://github.com/jkalbhenn/scrypt")
url=https://github.com/jkalbhenn/scrypt
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}
package() {
  cd $pkgname
  ./exe/make+install.sh "$pkgdir"
}
