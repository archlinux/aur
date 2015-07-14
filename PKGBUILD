# Contributor: Marc Poiroud <marci1 AT archlinux.fr>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=xcursor-archcursorblue
pkgver=1.1
pkgrel=1
pkgdesc="ArchLinux cursor theme for X"
arch=('any')
url="http://xfce-look.org/content/show.php/Arch+Cursor+Theme+%28simple%29?content=135902"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/135902-ArchCursorTheme.tar.gz")
noextract=('135902-ArchCursorTheme.tar.gz')
md5sums=('ac2c9e3c6ddc46b36793007e6a5eeb48')

package() {
	cd "$srcdir"
	install -d -m 755 "$pkgdir/usr/share/icons"
	tar xfz "135902-ArchCursorTheme.tar.gz" -C "$pkgdir/usr/share/icons"
}

build() {
	cd "$srcdir"
}
