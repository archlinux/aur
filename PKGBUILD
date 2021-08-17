# Maintainer: Owl Collective <candlebrae@riseup.net>
pkgname=pluralnotes-bin
pkgver=1.0
pkgrel=1
pkgdesc="A terminal-based notebook utility designed for plural people."
arch=("x86_64")
url="https://github.com/candlebrae/pluralnotes"
license=('GPL')
depends=(zlib)
provides=("pluralnotes")
changelog=
source=($url/releases/download/v$pkgver/pluralnotes.tar.gz)
sha256sums=('07adfffc04a7ffc89f694127cd823d48d799a827e261fac192535b93eeb4f682')

package() {
  install -Dm 0755 $srcdir/pluralnotes/pluralnotes $pkgdir/usr/bin/pluralnotes
  install -Dm 0644 $srcdir/pluralnotes/LICENSE $pkgdir/usr/share/licenses/pluralnotes.tar.gz

}
