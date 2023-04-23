# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=xpeviewer-bin
pkgver=0.04
pkgrel=1
epoch=
pkgdesc="PE file viewer/editor for Windows, Linux and MacOS."
arch=(x86_64)
url="http://ntinfo.biz/"
license=('MIT')
groups=()
depends=(gcc-libs glibc qt5-base hicolor-icon-theme)
makedepends=()
checkdepends=()
optdepends=()
provides=(xpeviewer)
conflicts=(xpeviewer)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/horsicq/XPEViewer/releases/download/0.04/xpeviewer_0.04_Ubuntu_22.04_amd64.deb"
       https://raw.githubusercontent.com/horsicq/XPEViewer/47a2c70be88bd455dfca53ebdc89bd00b5108a14/LICENSE )
noextract=()
sha256sums=('9244a20b48c1ffa4be7d8d2714ff47f72a40bbecbd00ee6398754ed2e505f25c'
            '7fe712494db68b85f8288ef86d3faa21ef2fdacaef0f50170d92c014baa9eb79')
validpgpkeys=()


package() {
	install -Dm644 LIC* -t $pkgdir/usr/share/licenses/$pkgname/
	tar -xvpf data.tar.* -C $pkgdir
}
