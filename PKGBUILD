pkgname=hypr-cleaner
pkgver=1.0
pkgrel=1
pkgdesc="Script to remove GNOME Web/Console and replace Dolphin with Nautilus"
arch=('x86_64')
license=('GPL')
depends=('nautilus' 'pacman')
source=('cleaner.sh')
sha256sums=('SKIP')

package() {
    # Install the script into /usr/bin
    install -Dm755 "$srcdir/cleaner.sh" "$pkgdir/usr/bin/hypr-cleaner"
}
