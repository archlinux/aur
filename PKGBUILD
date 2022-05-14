# Maintainer: Tomkoid <tomkoid@tomkoid.tk>
# GitLab repo is temporarily unavailable
pkgname=blurry-text-fix
pkgver=2
pkgrel=3
pkgdesc="Fixes blurry text in GTK4 and Flatpak"
license=('GPL3')
provides=('blurry-text-fix')
install=$pkgname.install
arch=('x86_64')
depends=('gtk4')
optdepends=('flatpak')
backup=('usr/share/gtk-4.0/settings.ini')

package() {
	install -Dm755 ../settings.ini "$pkgdir/usr/share/gtk-4.0/settings-modified.ini"
}
