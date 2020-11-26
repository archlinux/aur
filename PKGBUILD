# Maintainer:  <yatsen71@oarchbox1>
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
  wpdir="$pkgdir/usr/share/wallpapers"
  install -vDm 755 winxp_bliss.jpg "$wpdir/winxp/bliss.jpg"
  install -vDm 755 win10_img1.jpg.aa "$wpdir/win10/img1.jpg"
  cat win10_img1.jpg.ab >> "$wpdir/win10/img1.jpg"
  cat win10_img1.jpg.ac >> "$wpdir/win10/img1.jpg"
  cat win10_img1.jpg.ad >> "$wpdir/win10/img1.jpg"
  #aur git repo cannot cantains subdir
  #find "winxp/" -type f -exec install -vDm 755 {} "$pkgdir/usr/share/wallpapers/{}" \;
}

# vim:set ts=2 sw=2 et:
