# Maintainer: Philipp Joram <mail@phijor.me>

pkgname=i3barfodder
pkgver=0.3.0
pkgrel=1
pkgdesc="A powerful status line generator for i3bar, the status bar of the window manager i3."
arch=(any)
url="https://gitlab.com/rndusr/i3barfodder"
license=('GPL')
depends=('python' 'python-psutil' 'python-pyinotify' 'python-dateutil')
source=("$pkgname-$pkgver"::git+"https://gitlab.com/rndusr/i3barfodder.git")
md5sums=(SKIP)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
