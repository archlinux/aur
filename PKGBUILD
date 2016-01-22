# Maintainer: Franek Madej <franek.madej@gmail.com>
pkgname=yadm
pkgver=1.03
pkgrel=1
pkgdesc="Yet Another Dotfiles Manager"
arch=('any')
url="https://github.com/TheLocehiliosan/yadm"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=('/bin/yadm')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/TheLocehiliosan/yadm/raw/master/yadm")
noextract=()
md5sums=('d05e3e36693f343da2e6bd2aa713909f')  #autofill using updpkgsums

build() {
  cd $srcdir
}

package() {
  cd $srcdir
  install -D -m 644 yadm $pkgdir/usr/bin/yadm
}
