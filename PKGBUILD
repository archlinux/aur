# Maintainer: Tomkoid <tomkoid@tomkoid.tk>
pkgname=blurry-text-fix
pkgver=1
pkgrel=4
pkgdesc="Fixes blurry text in GTK4 / GNOME (added support for Flatpak)"
license=('GPL3')
install=$pkgname.install
arch=('x86_64')
depends=('gtk4' 'flatpak')
backup=('usr/share/gtk-4.0/settings.ini')

package() {
	install -Dm755 ../settings.ini "$pkgdir/usr/share/gtk-4.0/settings-modified.ini"
}
