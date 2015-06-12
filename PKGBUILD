# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=git-extensions
pkgver=3
pkgrel=1
pkgdesc="Simple handy extensions for git"
arch=('any')
url="https://github.com/maandree/git-extensions"
license=('custom:GNUAllPermissiveLicense')
depends=('git' 'bash' 'awk')
provides=('git-extensions')
conflicts=('git-extensions')
source=(https://github.com/maandree/git-extensions/tarball/$pkgver)
md5sums=(dbd894f7d3071c51f4fbf0a54ec68e21)

build() {
  cd maandree-git-extensions-*
  make -B DESTDIR="$pkgdir/"
}

package() {
  cd maandree-git-extensions-*
  make DESTDIR="$pkgdir/" install
}
