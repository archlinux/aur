# Maintainer: jtagcat <arch-3ff61201@jtag.cat>

pkgname=gnome-screenshot-stub
pkgver=1.0.0
pkgrel=1
arch=('any')
pkgdesc="Wrapper for grim implementing only -f|--file and -p."
url="https://aur.archlinux.org/packages/gnome-screenshot-stub"
license=('GPL-3.0-or-later')

depends=('grim' 'bash' 'ncurses')
provides=('gnome-screenshot')
conflicts=('gnome-screenshot')

source=("stub.sh")
sha256sums=('b9e0115110d051a124d44ab9cf524a4efac4b9d753fdf8cb76b3fbcd7ae6c0e5')

package() {
    install -Dm 755 stub.sh "$pkgdir/usr/bin/gnome-screenshot"
}
