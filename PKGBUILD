# Maintainer: Akiko Kumagara <akikokumagara@proton.me>
execname=gmodcefcodecfix
pkgname="$execname-bin"
projname=GModCEFCodecFix
pkgver=20230929
pkgrel=3
srcdir="$pkgname-$pkgver"
binname="$projname-Linux"
epoch=
pkgdesc="Automatic Patching/Updating of GMod CEF"
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
md5sums=('c6dc00f43e635c6d439df907fba5419f')
validpgpkeys=()

package() {
	mv -v "$binname" "$execname"
	install -d "$pkgdir"/usr/bin/
	install -m755 "$execname" "$pkgdir"/usr/bin/$execname
}
