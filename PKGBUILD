# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
# Maintainer: sickcodes <inbox at sick dot codes>
# Contributor: Aleritty <aleritty at aleritty dot net>
# Contributor: Felix Yan <felixonmars@gmail.com>

_basename=xdotoolgui
pkgname=xdotool-gui
pkgver=3.0
pkgrel=1
pkgdesc="GUI for command-line X11 automation tool"
arch=('any')
url="https://github.com/aleritty/xdotool-gui"
license=('GPL')
makedepends=('git')
depends=('xdotool' 'python3' 'gobject-introspection-runtime' 'python-gobject') #'PyGObject for python
source=("git+https://github.com/aleritty/xdotool-gui")
sha256sums=('SKIP')

package() {
  pushd $pkgname

  install -Dm755 xdotoolgui.py -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 xdotoolgui.glade -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 xdotoolgui.png -t "$pkgdir/usr/share/$pkgname/"
  install -Dm755 xdotool-gui -t "$pkgdir/usr/local/bin/"
  install -Dm644 xdotoolgui.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

