# Maintainer: Cynthia Coan <cynthia@coan.dev>

pkgname=ant-dracula-gtk-theme
pkgver=1.3.0
pkgrel=2
pkgdesc="Ant Dracula Theme for GTK 3.x"
license=('GPL3')
arch=(any)
url=https://github.com/EliverLara/Ant-Dracula
depends=('gtk3')
conflicts=(ant-dracula-theme-git)
options=(!strip)

source=("https://github.com/EliverLara/Ant-Dracula/archive/v$pkgver.tar.gz")
sha256sums=('5de816ebdcdc5cccf02c8965bf7a38e0a9718a769e274505bcf3809d3ce6ece8')

package(){
	cd "$srcdir"
    mv "Ant-Dracula-$pkgver" "Ant-Dracula"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
