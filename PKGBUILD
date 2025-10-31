# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=nautilus-backspace
pkgver=1.2
pkgrel=1
pkgdesc="A simple nautilus extension to bring back the 'Backspace' shortcut."
arch=("any")
url="https://github.com/TheWeirdDev/nautilus-backspace"
license=("GPL-3.0-or-later")
depends=("libnautilus-extension>=48" "python" "nautilus>=48" "python-nautilus")
makedepends=()
provides=("nautilus-backspace")
conflicts=("nautilus-backspace")
source=("${pkgname}::git+https://github.com/TheWeirdDev/nautilus-backspace")
b2sums=("SKIP")

package() {
	cd $srcdir/$pkgname/
	install -Dm644 nautilus-backspace.py -t $pkgdir/usr/share/nautilus-python/extensions/
}
