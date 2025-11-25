# Maintainer: Ioachim Radu <righita@disroot.org>

# Original package maintainer (closed-source)
# Maintainer: IDEMIA <support@idemia.com>

pkgname=idplugclassic-ro-cei-bin
pkgver=4.5.0
pkgrel=1
epoch=
pkgdesc="Romanian eID card driver and companion"
arch=('x86_64')
url="https://hub.mai.gov.ro/aplicatie-cei"
license=('custom')
groups=()
depends=(pcsclite pcsc-tools cairo fontconfig gcc-libs gdk-pixbuf2 glib2 gtk3 libjpeg-turbo pango gcc-libs libtiff libx11 libxkbcommon)
makedepends=()
checkdepends=()
optdepends=()
provides=(idplugclassic)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.deb::https://hub.mai.gov.ro/cei/info/descarca-middleware?versiune=450linux")
noextract=()
sha256sums=('4d084400dcd80535fcbf5e2b3194e996039ec96199241573b1d63af7bfeb0484')

package() {
    bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}"
	# Permissions already set in the debian package,
	# No debian-specific  files to clean
	# No pre or post install scripts to run
}
