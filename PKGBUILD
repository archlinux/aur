# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
pkgname=notparadoxlauncher
pkgver=1.3.1
pkgrel=1
install=$pkgname.install
pkgdesc='Alternative for Paradox Launcher'
arch=(x86_64)
url='https://github.com/shusaura85/notparadoxlauncher'
license=(MIT)
depends=(qt5pas)
source=("https://github.com/shusaura85/notparadoxlauncher/releases/download/v$pkgver/Linux.Not.Paradox.Launcher.v$pkgver.x64.tar.xz")
sha256sums=('aedd9d358160134c4d29da00c0d796aea770c24f03cd32951c4bfc03898601cd')

package() {
  cd "$srcdir"
  install -Dt "$pkgdir/usr/bin" bootstrapper-v2
  install -Dt "$pkgdir/usr/bin" launcher
  install -Dt "$pkgdir/usr/share/doc/$pkgname" readme.txt
}

# vim:set ts=2 sw=2 et:
