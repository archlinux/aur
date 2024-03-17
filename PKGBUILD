# Maintainer: Akiko Kumagara <akikokumagara@proton.me>
execname=gmodcefcodecfix
pkgname="$execname-bin"
projname=GModCEFCodecFix
pkgver=20240317
pkgrel=4
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
md5sums=('ecde2886fe39c0563e0acdae7f2ff686')
validpgpkeys=()

package() {
	mv -v "$binname" "$execname"
	install -d "$pkgdir"/usr/bin/
	install -m755 "$execname" "$pkgdir"/usr/bin/$execname
}
