# Maintainer: George Shammas <george@shamm.as>

pkgname=e-wrapper
pkgver=0.2
pkgrel=1
pkgdesc="invoke your editor, with optional file:lineno handling"
arch=('any')
url="https://github.com/kilobyte/e"
depends=('perl' 'sensible-utils')
source=(https://github.com/kilobyte/e/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('79112bde9f4d1c5c02b40cec9c027a3de16d8644f61a19932d63399a29918d94')

package() {
  cd e-${pkgver}
  install -Dm755 e $pkgdir/usr/bin/e
  install -Dm644 e.1 $pkgdir/usr/share/man/man1/e.1
}
