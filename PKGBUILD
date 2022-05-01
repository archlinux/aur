# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mücahit Saratar <trregen222@gmail.com>
pkgname=all2done
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Flutter based to-do application"
arch=(x86_64)
url="https://github.com/MucahitSaratar/gefangen"
license=('GPL')
groups=()
depends=()
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
md5sums=('SKIP')
validpgpkeys=()


package() {
	cd gefangen
	sudo mkdir -p /opt/all2done
	sudo cp -r * /opt/all2done/
	sudo ln -s /opt/all2done/gefangen /usr/bin/all2done
	sudo cp /opt/all2done/all2done.desktop /usr/share/applications/
}
