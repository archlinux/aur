# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=xmachoviewer-bin
pkgver=0.04
pkgrel=1
epoch=
pkgdesc="Mach-O viewer for Windows, Linux and MacOS"
arch=(x86_64)
url="https://horsicq.github.io/#xmachoviewer"
license=('MIT')
groups=()
depends=(hicolor-icon-theme glibc gcc-libs qt5-base)
makedepends=()
checkdepends=()
optdepends=()
provides=(xmachoviewer)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
https://raw.githubusercontent.com/horsicq/XMachOViewer/90b60a259c5cf3ad38d402be2d124947eb92e77b/LICENSE
"https://github.com/horsicq/XMachOViewer/releases/download/$pkgver/xmachoviewer_${pkgver}_Ubuntu_22.04_amd64.deb")
noextract=()
sha256sums=('7fe712494db68b85f8288ef86d3faa21ef2fdacaef0f50170d92c014baa9eb79'
            'b39f9470d3b85e84b5123349a25e35ad414371c96d2980ac035780b6f69d2a8b')
validpgpkeys=()


package() {
	install -Dm644 LIC* -t $pkgdir/usr/share/licenses/$pkgname/
	tar -xvpf data.tar.* -C $pkgdir
}
