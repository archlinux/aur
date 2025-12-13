pkgname=fido2-key-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="A GTK GUI tool for managing FIDO2 security keys"
arch=('any')
url="https://github.com/kev2600/FIDO2-Key-Manager"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3' 'libfido2' 'xterm')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

build() {
  :
}

package() {
  cd "$srcdir/FIDO2-Key-Manager"
  install -Dm755 fido2_gui.py "$pkgdir/usr/bin/fido2-key-manager"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

