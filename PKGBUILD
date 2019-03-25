# Contributor: Ke Liu <spcter119@gmail.com>
pkgname=fermisurfer
pkgver=1.10.1
pkgrel=0
pkgdesc="Fermisurfer can display Fermi surfaces colored as a function of arbitraly quantities such as the orbital character."
arch=('any')
url="https://osdn.net/projects/fermisurfer/"
depends=('freeglut')
source=("https://osdn.net/dl/fermisurfer/fermisurfer-$pkgver.zip")
noextract=()
sha256sums=('631ed9688fe54a0700ffbf349a5b784d5bac640486887861cf69f9f2c4e47be5')
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}