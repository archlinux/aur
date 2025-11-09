# Maintainer: Abdur Rehman Imran <arehmanimran4@gmail.com>
pkgname=nautilus-konsole
pkgver=0.0.1
pkgrel=1
pkgdesc="Just a very simple extension to open a directory in Konsole using Nautilus."
arch=('any')
url="https://github.com/abdurehman4/nautilus-konsole"
license=('GPL')
provides=('nautilus-konsole')
depends=('nautilus-python')
source=(git+"https://github.com/abdurehman4/nautilus-konsole.git")
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/usr/share/nautilus-python/extensions/"
  install -D "$pkgname/nautilus-konsole.py" "$pkgdir/usr/share/nautilus-python/extensions/"
}

