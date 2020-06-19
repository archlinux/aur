# Maintainer: Cynthia Coan <cynthia@coan.dev>

pkgname=ant-dracula-gtk-theme
pkgver=1.3.0
pkgrel=3
pkgdesc="Ant Dracula Theme for GTK 3.x"
license=('GPL3')
arch=(any)
url=https://github.com/dracula/gtk
depends=('gtk3')
conflicts=(ant-dracula-theme-git)
options=(!strip)

source=("https://github.com/dracula/gtk/archive/v$pkgver.tar.gz")
sha256sums=('c96c4152a2fdf38765da764b2d39aa5b37f97f7a787a6eab08e5351abded5fc4')

package(){
	cd "$srcdir"
    mv "gtk-$pkgver" "Ant-Dracula"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
