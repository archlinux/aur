# Contributor: Adria Arrufat <swiftscythe @t gmail d@t com>
# Contributor: Gordin <9ordin @t gmail d@t com>

pkgname=screenkey
pkgver=0.5
pkgrel=1
pkgdesc="Screencast tool to show your keys inspired by Screenflick, based on key-mon. Active fork with new features."
arch=('any')
url="https://github.com/wavexx/screenkey"
license=('GPL3')
depends=('pygtk' 'python2-xlib' 'xorg-xmodmap')
makedepends=('python2-distutils-extra' 'python2-setuptools')
source=("https://github.com/wavexx/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha1sums=('aa62cc6af4849fd9ca4e2cde7c19243e14cd105d')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  python2 setup.py install --skip-build --optimize=1 --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
