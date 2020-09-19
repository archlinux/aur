# Maintainer: Cynthia Coan <cynthia@coan.dev>

pkgname=ant-dracula-gtk-theme
pkgver=2.0
pkgrel=1
pkgdesc="Ant Dracula Theme for GTK 3.x"
license=('GPL3')
arch=(any)
url=https://github.com/dracula/gtk
depends=('gtk3')
conflicts=(ant-dracula-theme-git)
options=(!strip)

source=("https://github.com/dracula/gtk/archive/v$pkgver.tar.gz")
sha256sums=('2cfbaef1fa79c8b9361e3aa9d9d19a0fefadec43562c1fbe148b38f2559e6fe3')

package(){
	cd "$srcdir"
    mv "gtk-$pkgver" "Ant-Dracula"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
