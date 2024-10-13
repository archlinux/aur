# Maintainer: Akiko Kumagara <akikokumagara@proton.me>
execname=gmodcefcodecfix
pkgname="$execname-bin"
projname=GModCEFCodecFix
pkgver=20240926
pkgrel=6
srcdir="$pkgname-$pkgver"
binname="$projname-Linux"
epoch=
pkgdesc="🛠 Automatic Patching/Updating of GMod CEF. Also fixes macOS/Linux launch issues and missing main menu issues."
arch=('x86_64')
url="https://github.com/solsticegamestudios/$projname"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('gmodcefcodecfix')
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("$url/releases/download/$pkgver/$binname")
noextract=()
md5sums=('6f58e180e7bb6e4c87b98a4cb1b3cd39')
validpgpkeys=()

package() {
	mv -v "$binname" "$execname"
	install -d "$pkgdir"/usr/bin/
	install -m755 "$execname" "$pkgdir"/usr/bin/$execname
}
