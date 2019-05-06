# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=lighttable-square-fix
pkgver=1.0.0
pkgrel=0
pkgdesc="LightTable Fix for squares instead of letters in (open, save, ...) dialogs."
arch=('x86_64')
url="https://github.com/ArchI3Chris/LightTable-Square-Fix"
license=('MIT')
depends=('pango')
optdepends=('lighttable-bin')
source=("https://github.com/ArchI3Chris/LightTable-Square-Fix/raw/master/libpangoft2-1.0.so.0.4000.5")
sha256sums=('699571efa45d64d5b11bf38d1cb9a155c9b2b1e595c10737d5fede3baff90722')


package() {
  install -Dm644 libpangoft2-1.0.so.0.4000.5 "${pkgdir}/opt/LightTable/libpangoft2-1.0.so.0.4000.5"
  ln -s libpangoft2-1.0.so.0.4000.5 "${pkgdir}/opt/LightTable/libpangoft2-1.0.so.0"
}

# vim:set ts=2 sw=2 et:
