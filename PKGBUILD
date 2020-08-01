# Maintainer: Sky Aw <sky100aw@gmail.com>

pkgname=fetchpac
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool written in Bash for printing system package information."
arch=('any')
url="https://github.com/sky-aw/fetchpac"
license=('GPL')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+https://github.com/sky-aw/fetchpac.git")
md5sums=('SKIP') #autofill using updpkgsums

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}