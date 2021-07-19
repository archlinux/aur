# Maintainer: Geam Cube <igor.b2@op.pl>
pkgname=quit
pkgver=1.0
pkgrel=1
pkgdesc="The most useless package on the AUR."
arch=(any)
url="https://github.com/thenxguy/quit"
license=('GPL3')
depends=(bash)
makedepends=(git bash)
install=
source=(git+https://github.com/thenxguy/quit.git)
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd "quit/stable-source"
  echo This is a Bash script. It does not need compiling. 
}

package() {
  cd "quit/stable-source"
echo Installing Quit...
mkdir "$pkgdir/usr"
mkdir "$pkgdir/usr/bin"
cp -v quit "$pkgdir/usr/bin"
chmod +x "$pkgdir/usr/bin/quit"
echo Done. If running makepkg without --install, maybe install quit with install? wink wink
}
