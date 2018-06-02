# Maintainer RetardedOnion@archlinux-irc
pkgname=seahorse-adventures
pkgver=1.0.1
pkgrel=1
pkgdesc="Help Barbie the seahorse float on bubbles to the moon. 2D Platformer."
arch=('i686' 'x86_64')
url="https://github.com/Nebuleon/barbie-seahorse-adventures"
license=('GPL-2')
groups=()
depends=('python2' 'ttf-aenigma' 'python-pygame')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('seahorse-adventures::git://github.com/Nebuleon/barbie-seahorse-adventures'
	'seahorse-adventures.desktop'
	'seahorse-adventures.png'
	'seahorse-adventures.xpm')
noextract=()

package() {
mkdir -p $pkgdir/opt/${pkgname}
cp -r ${srcdir}/${pkgname}/* $pkgdir/opt/${pkgname}/
install -D -m755 "$srcdir/seahorse-adventures.png" "$pkgdir/usr/share/pixmaps/seahorse-adventures.png"
install -D -m755 "$srcdir/seahorse-adventures.xpm" "$pkgdir/usr/share/pixmaps/seahorse-adventures.xpm"
install -D -m755 "$srcdir/seahorse-adventures.desktop" "$pkgdir/usr/share/applications/seahorse-adventures.desktop"
}
md5sums=('SKIP'
         '29e99d2a45c4cf9694842fc2189d3576'
         '8427387ee103fab93f2fe9781086f387'
         'd295e7682cf6bdc8264a65401a7b21fb')
