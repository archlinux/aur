# Maintainer: Your Name <lloyd.w.henning@gmail.com>
pkgname=ob-xd
pkgver=1.4
pkgrel=1
epoch=
pkgdesc="Virtual Analog Synthesizer VST based on the Oberheim OB-X"
arch=(x86_64)
url="https://github.com/2DaT/Obxd"
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
source=("http://static.kvraudio.com/files/231/obxd14linux.zip ")
noextract=()
md5sums=("49c189ab77fd998dd99b2467fb46b73f")
validpgpkeys=()

package() {
	dest="$pkgdir/usr/lib/vst"
	mkdir -p "$dest"
	cp Obxd64.so "$dest"
}
