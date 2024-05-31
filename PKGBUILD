# Maintainer: Raphael Tittel <raphaeltittel@gmail.com>
pkgname="bindump-git"
pkgver=1.01
pkgrel=1
pkgdesc="Display binary contents of any file."
arch=("x86_64" "arm")
url="https://github.com/Raphadoodle/bindump-git.git"
license=('GPL')
groups=()
depends=("xxd" "python3")
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
sha256sums=('SKIP')
validpgpkeys=()

package() {
	cd "$pkgname"
	install -Dm755 bindump "${pkgdir}/usr/local/bin/bindump"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
