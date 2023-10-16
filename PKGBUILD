# Maintainer: Gerard Salvatella <mail@gerardsalvatella.com>

pkgname=yoctolib-cmdlines
pkgver=55747
pkgrel=1
epoch=
pkgdesc="Cli binaries for Yoctopuce USB devices"
arch=('x86_64')
url="https://www.yoctopuce.com"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=("virtualhub: web server daemon")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.yoctopuce.com/FR/downloads/Cmdlines.linux_intel.${pkgver}.zip"
       )
noextract=()
sha256sums=("SKIP"
           )
validpgpkeys=()

package() {
	install -d "${pkgdir}/usr/bin/"
	install -Dm755 Binaries/linux/64bits/* "${pkgdir}/usr/bin"
}
