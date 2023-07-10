# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jadon Gearhart <jadongearhart@gmail.com>
pkgname=faur
pkgver=1.00
pkgrel=1
epoch=
pkgdesc="The Fancy aur helper. Based off of the awesome PKGBUILDer library. Built for ricers."
arch=(x86_64)
url="https://github.com/jadonus/faur.git"
license=('GPL')
groups=()
depends=(noto-fonts-emoji python python-setuptools python-pip)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

build() {
	pip install colorama
  pip install pkgbuilder
}


package() {
	cd faur
  chmod +x faur
	cp faur /usr/local/bin
}
