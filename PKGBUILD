# Maintainer: Tomkoid <tomkoid@tomkoid.tk>
pkgname=blurry-text-fix
pkgver=2
pkgrel=1
pkgdesc="Fixes blurry text in GTK4 / GNOME (added support for Flatpak)"
license=('GPL3')
install=$pkgname.install
arch=('x86_64')
depends=('gtk4')
optdepends=('flatpak')
backup=('usr/share/gtk-4.0/settings.ini')

package() {
	install -Dm755 ../settings.ini "$pkgdir/usr/share/gtk-4.0/settings-modified.ini"
}
