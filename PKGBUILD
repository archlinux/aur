# Maintainer: Akiko Kumagara <akikokumagara@proton.me>
execname=gmodcefcodecfix
pkgname="$execname-bin"
projname=GModCEFCodecFix
pkgver=20230731
pkgrel=1
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
md5sums=('169b894bd2031f5156caf8efd4dedf3b')
validpgpkeys=()

package() {
	mv -v "$binname" "$execname"
	install -d "$pkgdir"/usr/bin/
	install -m755 "$execname" "$pkgdir"/usr/bin/$execname
}
