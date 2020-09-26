
# Maintainer: Jack Johannesen <jack AT insertdomain DOT name>

pkgname="freshfetch"
pkgver=0.1.2
pkgrel=1
pkgdesc="A fresh take on Neofetch"
arch=('x86_64')
url="https://github.com/K4rakara/freshfetch"
license=('MIT')
depends=()
makedepends=()
optdepends=('xorg-xrandr' 'xorg-xwininfo')
provides=('freshfetch')
conflicts=('freshfetch-git')
source=("https://github.com/K4rakara/$pkgname/releases/download/v$pkgver/freshfetch.tar.gz")
md5sums=('6c7c4073911fbf9e1d83539ec072f51a')
noextract=('freshfetch.tar.gz')

package() {
  cd $pkgdir;
  tar -xzvf $srcdir/../freshfetch.tar.gz;
  chown root:root usr/bin/freshfetch;
}

