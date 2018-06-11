# Maintainer: Your Name <lloyd.w.henning@gmail.com>
pkgname=ob-xd
pkgver=1.4
pkgrel=2
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
source=("https://www.discodsp.com/download/?id=9")
noextract=()
md5sums=("868a0f439c25facd8087abdd44a2e7e6")
validpgpkeys=()

package() {
	dest="$pkgdir/usr/lib/vst"
	mkdir -p "$dest"
	cp Obxd64.so "$dest"
}
