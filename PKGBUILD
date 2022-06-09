# Maintainer: Tomkoid <tomkoid@tomkoid.tk>
# GitLab repo is temporarily unavailable
pkgname=blurry-text-fix
pkgver=2
pkgrel=7
pkgdesc="Fixes blurry text in GTK4 / GTK3 and Flatpak"
license=('GPL3')
provides=('blurry-text-fix')
install=blurry-text-fix.install
arch=('any')
depends=('gtk4')
optdepends=('flatpak')

package() {
	install -Dm644 ../settings.ini "$pkgdir/etc/blurry-text-fix/gtk-3.0/settings.ini"
    install -Dm644 ../settings.ini "$pkgdir/etc/blurry-text-fix/gtk-4.0/settings.ini"
    install -Dm755 ../blurry-text-fix-reinstall "$pkgdir/usr/bin/blurry-text-fix-reinstall"
    install -Dm755 ../blurry-text-fix-cairo "$pkgdir/usr/bin/blurry-text-fix-cairo"
}
