# Maintainer: Eoghan West <eowest@gmail.com>
pkgname=vital-synth-desktop-file
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="a deskotp file for the Vital wavetable synth software"
arch=(x86 x86_64)
url="https://github.com/calacuda/vital-desktop-aur"
license=('MIT')
groups=()
depends=(vital-synth)
makedepends=()
checkdepends=()
optdepends=()
provides=(vital-synth-desktop-file)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

package() {
	# cd "$pkgname-$pkgver"
	cd "$srcdir/$_pkgname/vital-desktop-aur/"
	# make DESTDIR="$pkgdir/" install
	ls -la "${pkgdir}"
	
	mkdir -p "${pkgdir}"/usr/share/{applications,pixmaps}/
	
	install ./vital-synth.desktop "${pkgdir}/usr/share/applications/vital-synth.desktop"
	install ./vital.png "${pkgdir}/usr/share/pixmaps/vital.png"
}
