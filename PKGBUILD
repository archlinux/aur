# Maintainter: mehlon <nintendima@gmail.com>
pkgname=acme-sac-git
pkgver=1
pkgrel=1
pkgdesc="Programmer's editor and shell, running over Inferno"
arch=('x86_64')
url="http://code.google.com/p/acme-sac/"
license=('GPL')
depends=('lib32-libx11' 'lib32-libxext' 'gcc-multilib')
provides=('acme')
conflicts=('acme')
source=('acme-sac-git::git+https://github.com/mehlon/acme-sac')
md5sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share"
	mkdir -p "$pkgdir/usr/bin"
	
	cp "$srcdir/$pkgname/acme-sac" "$pkgdir/usr/bin/acme-sac"
	cp -r "$srcdir/$pkgname/" "$pkgdir/usr/share/acme-sac"
}
