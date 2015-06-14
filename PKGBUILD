# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=gournal
pkgver=0.5.1.1
_pkgver=0.5.1-1
pkgrel=1
pkgdesc='A note-taking application written for usage on Tablet-PCs'
arch=('any')
url='http://www.adebenham.com/old-stuff/gournal/'
license=('GPL')
groups=()
depends=(gnomecanvas-perl perl-gnome2-print perl-xml-mini)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install='gournal.install'
source=("http://www.adebenham.com/debian/${pkgname}_$_pkgver.tar.gz"
gournal.desktop)
noextract=()

build(){
  cd "$srcdir/$pkgname"
  install -Dm755 gournal $pkgdir/usr/bin/gournal
  install -Dm644 gournal.glade $pkgdir/usr/share/gournal/gournal.glade
  install -Dm644 ../gournal.desktop $pkgdir/usr/share/applications/gournal.desktop
  cp pixmaps/*.png $pkgdir/usr/share/gournal
}
md5sums=('1a62fcf5acef439f975c689ef2617517'
         '8d1cc9cd524a8bc4fe3ee2a2cef88fd0')
