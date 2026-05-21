# Maintainer Cookie Engineer <@cookiengineer>

pkgname=bettercap-ui
pkgver=1.4.0
pkgrel=2
pkgdesc="Official Bettercap's Web UI."
arch=('any')
url='https://github.com/bettercap/ui'
license=('GPL3')
source=("https://github.com/bettercap/ui/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('414365f9f74505fd5bccab9542dd64c64b5c1d675120bc66cdd1de5899ad0ed7721ccd2026d532826c456b578447930fec2cc0ad003bc2f73d400df18ef4c339')

package() {
  install -dm 755 "$pkgdir/usr/share/bettercap"
  cp -aR ui-$pkgver/dist/ui "$pkgdir/usr/share/bettercap/ui"
}
