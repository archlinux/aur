# Maintainer: PrincParshia <princparshia@gmail.com>

pkgname=adw-maia-gtk-theme
pkgver=6.4
pkgrel=1
pkgdesc="Manjaro variation of Adw GTK theme"
arch=(x86_64)
url="https://github.com/PrincParshia/adw-maia-gtk-theme"
license=('LGPL')
makedepends=('git')
conflicts=('xdg-desktop-portal-gnome')
source=("git+$url")
sha256sums=('SKIP')

package() {
	install -d "$pkgdir/usr/share/themes"
    cp -r "$srcdir/adw-maia-gtk-theme/Adw-Maia" "$pkgdir/usr/share/themes/"
    cp -r "$srcdir/adw-maia-gtk-theme/Adw-Dark-Maia" "$pkgdir/usr/share/themes/"
}
