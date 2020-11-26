# Maintainer:  <kitech@oarchbox1>
pkgname=winmacs-wallpapers
pkgver=2020.12
pkgrel=1
epoch=
pkgdesc="Windows and MacOS wallpapers"
arch=('i686' 'x86_64')
url="https://github.com/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=($pkgname-$pkgver.tar.gz
#        $pkgname-$pkgver.patch)
source=()
noextract=()

prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  #patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #./configure --prefix=/usr
  #make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/wallpapers/"
  #install -v -d -D "$startdir/winxp/" "$pkgdir/usr/share/wallpapers/"
  cd "$startdir"
  install -vDm 755 winxp_bliss.jpg "$pkgdir/usr/share/wallpapers/winxp/bliss.jpg"
  #aur git repo cannot cantains subdir
  #find "winxp/" -type f -exec install -vDm 755 {} "$pkgdir/usr/share/wallpapers/{}" \;
}

# vim:set ts=2 sw=2 et:
