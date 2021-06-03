# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
_pkgname=notparadoxlauncher
pkgname=$_pkgname-bin
pkgver=1.3.1
pkgrel=1
install=$pkgname.install
provides=($_pkgname)
conflicts=($_pkgname)
pkgdesc='Alternative for Paradox Launcher; binary package avoiding large Lazarus download'
arch=(x86_64)
url='https://github.com/shusaura85/notparadoxlauncher'
license=(MIT)
depends=(qt5pas)
source=("https://raw.githubusercontent.com/shusaura85/notparadoxlauncher/v$pkgver/LICENSE"
        "https://github.com/shusaura85/notparadoxlauncher/releases/download/v$pkgver/Linux.Not.Paradox.Launcher.v$pkgver.x64.tar.xz")
sha256sums=('cd96cd87317b0dddd86e3d6429b17899aac92ccf5d584f50116270b4c0198ba3'
            'aedd9d358160134c4d29da00c0d796aea770c24f03cd32951c4bfc03898601cd')

package() {
  cd "$srcdir"
  install -Dt "$pkgdir/usr/bin" launcher bootstrapper-v2
  install -Dt "$pkgdir/usr/share/doc/$_pkgname" readme.txt
  install -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
