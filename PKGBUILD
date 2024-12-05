# Maintainer: invverse <cheery DOT art2642 AT fastmail DOT com>
pkgname=gridtracker2-bin
pkgver=2.241203.0
pkgrel=1
pkgdesc='An amateur radio companion'
url='https://gridtracker.org'
source_x86_64=("https://download2.gridtracker.org/GridTracker2-$pkgver-x64.pacman")
source_aarch64=("https://download2.gridtracker.org/GridTracker2-$pkgver-aarch64.pacman")
source_armv7h=("https://download2.gridtracker.org/GridTracker2-$pkgver-armv7l.pacman")
arch=('x86_64' 'aarch64' 'armv7h')
license=('BSD-3-Clause')
optdepends=('libappindicator-gtk3: tray notifications')
provides=('gridtracker2')
sha256sums_x86_64=('960e63c038aa4382eb4c40b6b494e827900fbcc803fce9df1474ae528a721548')
sha256sums_aarch64=('52ec34c4fd092d6d7819ad40ba9109d5965c2b8115a3546371ac5cf8b2041aff')
sha256sums_armv7h=('dbba2736d591746614893eb2aba5852f16e0a18590217b09aca26e6243e818a5')

package() {
  cd "$srcdir/"
  cp -r {opt,usr} "${pkgdir}/"
}

