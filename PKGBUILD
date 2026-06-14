pkgname=debtap-gui-gtk
pkgver=2.2.0
pkgrel=1
pkgdesc="A modern GTK4/Libadwaita GUI for debtap"
arch=('any')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'debtap')

# Buraya scriptinin ve desktop dosyanın olduğu klasördeki isimleri yaz
source=('debtap-gui-gtk.py' 'debtap-gui-gtk.desktop')
md5sums=('SKIP' 'SKIP')

package() {
    # 1. Python dosyasını /usr/bin'e at
    install -Dm755 "$srcdir/debtap-gui-gtk.py" "$pkgdir/usr/bin/debtap-gui-gtk"

    # 2. Desktop dosyasını /usr/share/applications'a at
    install -Dm644 "$srcdir/debtap-gui-gtk.desktop" "$pkgdir/usr/share/applications/debtap-gui-gtk.desktop"
}
