# Maintainer: Mr. Outis <mroutis@protonmail.com>
pkgname=juiced-git
pkgver=1.0.0
pkgrel=3
pkgdesc="A lightweight battery warning daemon"
arch=('any')
url="https://github.com/drkhsh/${pkgname%-git}"
license=('ISC')
depends=('libnotify')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname%-git}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
