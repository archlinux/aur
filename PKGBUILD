# Maintainer: Grouvya! <grouvya@gmail.com>
pkgname=billtracker
pkgver=1.1.0
pkgrel=1
pkgdesc="Bill & Savings Tracker using GTK4 and Libadwaita"
arch=('any')
url="https://github.com/grouvya/billtracker" # Placeholder URL based on app ID
license=('unknown')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita')
makedepends=('git')
source=("Billtracker.py"
        "billtracker.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
    # 1. Create the destination directory for the executable
    install -d "$pkgdir/usr/bin"
    
    # 2. Install the python script as 'billtracker' with executable permissions (755)
    install -Dm755 "Billtracker.py" "$pkgdir/usr/bin/billtracker"

    # 3. Install the desktop entry so it appears in the menu
    install -Dm644 "billtracker.desktop" "$pkgdir/usr/share/applications/billtracker.desktop"
}
