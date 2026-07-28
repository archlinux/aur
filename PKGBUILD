# Maintainer: BananaBrother77 <me@bananabrother77.online>

_pkgname=bananadashboard
pkgname=${_pkgname}-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Desktop system dashboard by BananaBrother77"
arch=('x86_64')
url="https://github.com/BananaBrother77/BananaDashboard"
license=('MIT')

depends=(
  'gtk3'
  'nss'
  'libxss'
  'libxtst'
  'alsa-lib'
)

provides=('bananadashboard')
conflicts=('bananadashboard')

source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.pacman")

sha256sums=('SKIP')

package() {
  bsdtar -xvf "$srcdir/$_pkgname-$pkgver.pacman" -C "$pkgdir"
  rm -f "$pkgdir/.INSTALL" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}
